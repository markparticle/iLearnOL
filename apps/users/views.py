from pure_pagination import Paginator,EmptyPage,PageNotAnInteger
import json
from django.urls import reverse
from django.shortcuts import render
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password
from django.http import HttpResponse,HttpResponseRedirect
import datetime

from .forms import LoginForm,RegisterForm,CaptchaForm,ForgetForm,ModifyPwdForm,UploadImageForm,UserInfoForm
from utils.emil_send import send_register_email
from utils.mixin_utils import LoginRequiredMixin
from .models import UserProfile,EmailVerifyRecord,Banner,LoginBanner
from operation.models import UserCourse,UserFavorite,UserMessage
from organization.models import CourseOrg,Teacher
from courses.models import Course

# Create your views here.

class CustomBackend(ModelBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username)|Q(email=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None

class RegisterView(View):
    def get(self,request):
        register_form = CaptchaForm()
        all_banners = LoginBanner.objects.all().order_by('index')[:5]
        return render(request, "register.html",{'register_form':register_form,'all_banners':all_banners})
    def post(self,request):
        register_form = RegisterForm(request.POST)
        all_banners = LoginBanner.objects.all().order_by('index')[:5]
        if register_form.is_valid():
            user_name = request.POST.get("email", "")
            if UserProfile.objects.filter(email=user_name):
                return render(request,"register.html",{'msg':'邮箱已被注册','register_form':register_form,'all_banners':all_banners})
            else:
                pass_word1 = request.POST.get("password1", "")
                pass_word2 = request.POST.get("password2", "")
                if pass_word1==pass_word2:
                    user_profile = UserProfile()
                    user_profile.is_active = False
                    user_profile.username = user_name
                    user_profile.email = user_name
                    user_profile.password = make_password(pass_word2)
                    user_profile.save()        #保存至数据库
                    send_register_email(user_name,'register')  #发邮件

                    # # 写入欢迎消息
                    user_message = UserMessage()
                    user_message.user = user_profile.id
                    user_message.message = "欢迎注册iLearn!!"
                    user_message.save()
                    return render(request, 'login.html', {'username': user_name, 'msg': '激活链接已经已发送,前往邮箱请激活','all_banners':all_banners})
                else:
                    return render(request, "register.html", {'msg':'密码不一致,请重新输入','register_form': register_form,'all_banners':all_banners})
        else:
            return render(request, "register.html",{'register_form':register_form,'all_banners':all_banners})

class ActiveUserView(View):
    def get(self,request,active_code):
        all_banners = LoginBanner.objects.all().order_by('index')[:5]
        all_records = EmailVerifyRecord.objects.filter(code=active_code)
        if all_records:
            for record in all_records:
                email = record.email
                if record.is_active:
                    timenow= datetime.datetime.now()-datetime.timedelta(days=1)
                    if timenow < record.send_time:
                        user = UserProfile.objects.get(email=email)
                        user.is_active = True
                        user.save()

                        #激活后验证码失效
                        record.is_active = False
                        record.save()

                        return render(request, 'login.html', {'username': email,'msg': '已经成功激活','all_banners':all_banners})
                return render(request, 'login.html', {'username': email, 'msg': '链接已失效','all_banners':all_banners})
        else:
            return render(request, 'login.html', {'msg': '无效的链接','all_banners':all_banners})

class LoginView(View):
    def get(self,request):
        all_banners = LoginBanner.objects.all().order_by('index')[:5]
        return render(request, 'login.html', {'all_banners':all_banners})
    def post(self,request):
        login_form = LoginForm(request.POST)   #传入字典参数
        all_banners = LoginBanner.objects.all().order_by('index')[:5]
        if login_form.is_valid():
            user_name = request.POST.get("username", "")
            pass_word = request.POST.get("password", "")
            user = authenticate(username=user_name, password=pass_word)
            if user is not None:
                if user.is_active:
                    login(request, user)
                    return HttpResponseRedirect(reverse("index"))
                else:
                    all_records = UserProfile.objects.filter(username=user_name)
                    for record in all_records:
                        email = record.email
                        if UserProfile.objects.filter(email= email):
                            send_register_email(email, 'register')  # 发邮件
                            return render(request, 'login.html', {'login_form':login_form,'msg': '账户未激活,已重新发送激活链接至您的邮箱','all_banners':all_banners})
                        else:
                            return render(request, 'login.html', {'login_form':login_form,'msg': '账户未激活','all_banners':all_banners}) #添加手机验证
            else:
                return render(request, 'login.html', {'login_form':login_form,'msg': '用户名或密码错误','all_banners':all_banners})
        else:
            return render(request,'login.html',{'login_form':login_form,'all_banners':all_banners})

class LogoutView(View):
    def get(self,request):
        logout(request)
        #重定向
        return  HttpResponseRedirect(reverse("index"))


class ForgetPwdView(View):
    def get(self, request):
        all_banners = LoginBanner.objects.all().order_by('index')[:5]
        forget_form = CaptchaForm()
        return render(request, "forgetpwd.html", {"forget_from": forget_form,'all_banners':all_banners})
    def post(self, request):
        forget_form = ForgetForm(request.POST)
        all_banners = LoginBanner.objects.all().order_by('index')[:5]
        if forget_form.is_valid():
            email = request.POST.get("email", "")
            if UserProfile.objects.filter(email=email):
                user = UserProfile.objects.get(email=email)
                if user.is_active:
                    send_register_email(email, 'forget')  # 发邮件
                    return render(request, 'login.html', {'username':email, 'msg': '密码重置链接已经已发送,请前往邮箱查收','all_banners':all_banners})
                else:
                    send_register_email(email, 'register')
                    return render(request, 'login.html', {'username':email,'msg': '邮箱未验证,已重新发送激活链接','all_banners':all_banners})
            else:
                 return render(request, 'forgetpwd.html', {"forget_from": forget_form,'msg': '未找到该账户','all_banners':all_banners})
        else:
            return render(request, "forgetpwd.html", {"forget_from": forget_form,'all_banners':all_banners})


class ResetUserView(View):
    def get(self,request,reset_code):
        all_banners = LoginBanner.objects.all().order_by('index')[:5]
        all_records = EmailVerifyRecord.objects.filter(code=reset_code)
        modify_form = CaptchaForm(request.GET)
        if all_records:
            for record in all_records:
                email = record.email
                if record.is_active:
                    timenow = datetime.datetime.now() - datetime.timedelta(days=1)
                    if timenow < record.send_time:
                        return render(request, 'password_reset.html',{'email':email ,'record':reset_code})
                return render(request, 'login.html',{'username': email, 'msg': '链接已失效','all_banners':all_banners})
        else:
            return render(request, 'login.html', {'msg': '无效的链接','all_banners':all_banners})

class ModifyPwdView(View):
    """
    修改用户密码
    """
    def post(self,request):
        all_banners = LoginBanner.objects.all().order_by('index')[:5]
        modify_form = ModifyPwdForm(request.POST)
        email = request.POST.get('email', '')
        record = request.POST.get('record', '')
        if modify_form.is_valid():
            pwd1 = request.POST.get('password1','')
            pwd2 = request.POST.get('password2','')
            if pwd1 != pwd2 :
                return render(request,'password_reset.html',{'modify_form':modify_form,'msg':'密码不一致','email':email ,'record':record},)
            else:
                user = UserProfile.objects.get(email=email)
                user.password=make_password(pwd2)
                user.save()

                code=EmailVerifyRecord.objects.get(code=record)
                code.is_active = False
                code.save()
                return render(request, 'login.html', {'username':email,'msg':'成功修改密码','all_banners':all_banners})
        else:
            return render(request, 'password_reset.html', {'modify_form':modify_form,'email':email,'record':record })



class UpdatePwdView(LoginRequiredMixin, View):
    """
    个人中心修改密码
    """
    # login_url = '/login/'
    # redirect_field_name = 'next'
    def post(self, request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get("password1", "")
            pwd2 = request.POST.get("password2", "")
            if pwd1 != pwd2:
                return HttpResponse('{"status":"fail", "msg":"密码不一致"}',content_type='application/json')

            user = request.user
            user.password = make_password(pwd2)
            user.save()
            return HttpResponse('{"status":"success"}',content_type='application/json')
        else:
            return HttpResponse(json.dumps(modify_form.errors),content_type='application/json')


class UserInfoView(LoginRequiredMixin, View):
    '''
    用户个人信息
    '''
    # login_url = '/login/'
    # redirect_field_name = 'next'

    def get(self,request):
        return render(request,'usercenter-info.html',{})

    def post(self, request):
        user_info_form = UserInfoForm(request.POST, instance=request.user)
        if user_info_form.is_valid():
            user_info_form.save()
            print('2')
            return HttpResponse('{"status":"success"}',content_type='application/json')
        else:
            return HttpResponse(json.dumps(user_info_form.errors),content_type='application/json')


class UploadImageView(LoginRequiredMixin,View):
    """
    用户修改头像
    """
    def post(self,request):
        image_form = UploadImageForm(request.POST,request.FILES,instance=request.user)   #具有modleform功能
        if image_form.is_valid():
            image_form.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail"}', content_type='application/json')




class SendEmailCodeView(LoginRequiredMixin, View):
    """
    发送邮箱验证码
    """
    def get(self,request):
        # 取出需要发送的邮件
        email = request.GET.get("email", "")
        # 不能是已注册的邮箱
        if UserProfile.objects.filter(email=email):
            return HttpResponse('{"email":"邮箱已经存在"}', content_type='application/json')
        send_register_email(email, 'update_email')

        return HttpResponse('{"status":"success"}', content_type='application/json')


class UpdateEmailView(LoginRequiredMixin, View):
    """
    修改个人邮箱
    """
    # login_url = '/login/'
    # redirect_field_name = 'next'
    def post(self, request):
        email = request.POST.get("email", "")
        code = request.POST.get("code", "")
        existed_records = EmailVerifyRecord.objects.filter(email=email, code=code, send_type='update_email').first()

        if existed_records:
            if existed_records.is_active:
                timenow = datetime.datetime.now() - datetime.timedelta(days=1)
                if timenow < existed_records.send_time:
                    user = request.user
                    user.email = email
                    user.username = email
                    user.save()

                    existed_records.is_active = False
                    existed_records.save()
                    return HttpResponse('{"status":"success"}', content_type='application/json')
                else:
                    return HttpResponse('{"email":"验证码已过期"}', content_type='application/json')
        return HttpResponse('{"email":"验证码无效"}', content_type='application/json')


class MyCourseView(LoginRequiredMixin,View):
    """
    我的课程
    """
    def get(self,request):
        user_courses = UserCourse.objects.filter(user=request.user)
        return render(request,'usercenter-mycourse.html',{
            'user_courses':user_courses
        })


class MyFavOrgView(LoginRequiredMixin,View):
    '''
    我收藏的机构
    '''
    def get(self,request):
        org_list = []
        fav_orgs = UserFavorite.objects.filter(user = request.user,fav_type=2)
        for fav_org in fav_orgs:
            org_id = fav_org.fav_id
            org = CourseOrg.objects.get(id=org_id)
            org_list.append(org)
        return render(request,'usercenter-fav-org.html',{
            'org_list' : org_list,
        })


class MyFavTeacherView(LoginRequiredMixin,View):
    '''
    我收藏的讲师
    '''
    def get(self,request):
        teacher_list = []
        fav_teachers = UserFavorite.objects.filter(user = request.user,fav_type=3)
        for fav_teacher in fav_teachers:
            teacher_id = fav_teacher.fav_id
            teacher = Teacher.objects.get(id=teacher_id)
            teacher_list.append(teacher)
        return render(request,'usercenter-fav-teacher.html',{
            'teacher_list' : teacher_list,
        })


class MyFavCourseView(LoginRequiredMixin,View):
    '''
    我收藏的讲师
    '''
    def get(self,request):
        course_list = []
        fav_courses = UserFavorite.objects.filter(user = request.user,fav_type=1)
        for fav_course in fav_courses:
            course_id = fav_course.fav_id
            course = Course.objects.get(id=course_id)
            course_list.append(course)
        return render(request,'usercenter-fav-course.html',{
            'course_list' : course_list,
        })


class MymessageView(LoginRequiredMixin,View):
    """
    我的消息
    """
    def get(self,request):
        all_messages = UserMessage.objects.filter(user=request.user.id)

        #将未读消息标记为已读
        all_unread_messages = UserMessage.objects.filter(user=request.user.id,has_read=False)
        for unread_message in all_unread_messages:
            unread_message.has_read = True
            unread_message.save()

        #消息进行分页
        try:
            page = request.GET.get('page',1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_messages,5,request=request)  #每页取5个显示
        messages = p.page(page)

        return render(request,'usercenter-message.html',{
            'messages':messages
        })

class IndexView(View):
    '''
    首页
    '''
    def get(self,request):
        #取出轮播图
        all_banners = Banner.objects.all().order_by('index')[:5]
        courses = Course.objects.filter(is_banner=False)[:5]
        banner_courses = Course.objects.filter(is_banner=True)[:3]
        courses_orgs = CourseOrg.objects.all()[:15]

        return render(request,'index.html',{
        'all_banners':all_banners,
        'courses':courses,
        'banner_courses':banner_courses,
        'courses_orgs':courses_orgs,
        })


def page_not_found(request):
    '''
    全局404页面配置
    '''
    from django.shortcuts import render_to_response
    response = render_to_response("404.html", {})
    # 设置response的状态码
    response.status_code = 404
    return response


def page_error(request):
    '''
    全局500页面配置
    '''
    from django.shortcuts import render_to_response
    response = render_to_response("500.html", {    })
    response.status_code = 500
    return response
