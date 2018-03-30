from pure_pagination import Paginator,EmptyPage,PageNotAnInteger
from django.shortcuts import render
from django.views.generic import View
from django.http import HttpResponse
from django.db.models import Q

from .models import Course,CourseResource,Video
from operation.models import UserFavorite,CourseComments,UserCourse
from utils.mixin_utils import LoginRequiredMixin

# Create your views here.


class CourseListView(View):
    def get(self,request):
        all_courses = Course.objects.all().order_by('-add_time')  #默认的倒叙为最新
        hot_courses = all_courses.order_by('-click_nums')[:3]  # 排名前三的热门课程提取

        # 搜索功能
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            # 在name字段进行操作,做like语句的操作。i代表不区分大小写
            # or操作使用Q
            all_courses = all_courses.filter(Q(name__icontains=search_keywords) | Q(desc__icontains=search_keywords) | Q(
                detail__icontains=search_keywords))


        #排序   学习人数，点击次数
        sort = request.GET.get('sort', "")
        if sort:
            if sort == 'students':
                all_courses = all_courses.order_by('-students')
            elif sort == 'hot':
                all_courses = all_courses.order_by('-click_nums')

        # 课程机构进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_courses, 6, request=request)  # 每页取5个显示
        courses = p.page(page)

        return render(request,'course-list.html',{
            'all_courses':courses,
            'sort':sort,
            'hot_courses':hot_courses,
            'search_keywords':search_keywords
        })

class CourseDateilView(View):
    '''
    课程详情页
    '''
    def get(self,request,course_id):
        course = Course.objects.get(id=int(course_id))

        #增加课程点击数
        course.click_nums +=1
        course.save()

        #相关推荐
        tag = course.tag
        if tag:
            relate_courses = Course.objects.filter(tag=tag)[:3] #缺陷：未排除当前课程
        else:
            relate_courses = []  #传字符串进html的for 会报错

        # 判断是否收藏
        has_fav_course = False
        has_fav_org = False
        # 必须是用户已登录我们才需要判断。
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=course.id, fav_type=1):
                has_fav_course = True
            if UserFavorite.objects.filter(user=request.user, fav_id=course.course_org.id, fav_type=2):
                has_fav_org = True

        return render(request,'course-detail.html',{
            'course':course,
            'relate_courses':relate_courses,
            "has_fav_course": has_fav_course,
            "has_fav_org": has_fav_org,
        })


class CourseInfoView(LoginRequiredMixin,View):   #继承
    '''
    课程章节信息
    '''
    def get(self, request, course_id):

        #用户与课程关联
        course = Course.objects.get(id=int(course_id))
        user_courses = UserCourse.objects.filter(user=request.user, course=course)
        if not user_courses:
            user_course = UserCourse(user=request.user, course=course)
            user_course.save()
            #课程人数+1
            course.students += 1
            course.save()
            # 机构人数+1
            course.course_org.students += 1
            course.course_org.save()

        # 此处的id为表默认为我们添加的值。
        course = Course.objects.get(id=int(course_id))
        course_resources = CourseResource.objects.filter(course=course).order_by('-add_time')

        # 找出学过这门课的同学
        user_courses = UserCourse.objects.filter(course=course)
        user_ids = [user_course.user_id for user_course in user_courses]

        # 取出用户所学课程ID
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)  # 外键filter用法
        course_ids = [user_course.course_id for user_course in all_user_courses]

        relate_courses = Course.objects.filter(id__in=course_ids).order_by("-click_nums")


        return render(request, "course-video.html", {
            "course": course,
             "course_resources": course_resources,
            'relate_courses': relate_courses,

            })


class CourseCommentsView(LoginRequiredMixin,View):
    '''
    课程评论
    '''
    def get(self, request, course_id):
        # 此处的id为表默认为我们添加的值。
        course = Course.objects.get(id=int(course_id))
        course_resources = CourseResource.objects.filter(course=course).order_by('-add_time')
        all_comments = CourseComments.objects.all().order_by('-add_time')

        # 找出学过这门课的同学
        user_courses = UserCourse.objects.filter(course=course)
        user_ids = [user_course.user_id for user_course in user_courses]

        #取出用户所学课程ID
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)  # 外键filter用法
        course_ids = [user_course.course_id for user_course in all_user_courses]

        relate_courses = Course.objects.filter(id__in=course_ids).order_by("-click_nums")


        return render(request, "course-comment.html", {
            "course": course,
            "course_resources": course_resources,
            'all_comments':all_comments,
            'relate_courses':relate_courses,
        })

class AddComentsView(View):
    '''
    用户添加课程评论
    '''
    # 判断用户是否用户
    def post(self,request):
        if not request.user.is_authenticated:  # 判断用户是否登录
            return HttpResponse('{"status":"fail", "msg":"用户未登录"}', content_type='application/json')
        course_id = request.POST.get("course_id", 0)
        comments = request.POST.get("comments", "")
        if int(course_id) > 0 and comments:
            course_comments = CourseComments()
            course = Course.objects.get(id=int(course_id))  #filter不会抛出异常找不到就为空   get找不到会抛异常
            course_comments.course = course
            course_comments.comments = comments
            course_comments.user = request.user
            course_comments.save()
            return HttpResponse('{"status":"success", "msg":"评论成功"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail", "msg":"评论失败"}', content_type='application/json')



class VideoPlayView(View):
    '''
    视频播放页面
    '''
    def get(self, request, video_id):

        #用户与课程关联
        video = Video.objects.get(id=int(video_id))
        course = video.lesson.course
        user_courses = UserCourse.objects.filter(user=request.user, course=course)
        if not user_courses:
            user_course = UserCourse.filter(user=request.user,course = course)
            user_course.save()

        course_resources = CourseResource.objects.filter(course=course)
        # 选出学了这门课的学生关系
        user_courses = UserCourse.objects.filter(course=course)
        # 从关系中取出user_id
        user_ids = [user_course.user_id for user_course in user_courses]
        # 这些用户学了的课程,外键会自动有id，取到字段
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)
        # 取出所有课程id
        course_ids = [user_course.course_id for user_course in all_user_courses]
        # 获取学过该课程用户学过的其他课程
        relate_courses = Course.objects.filter(id__in=course_ids).order_by("-click_nums").exclude(id=course.id)[:4]
        # 是否收藏课程
        return render(request, "course-play.html", {
            "course": course,
            "course_resources": course_resources,
            "relate_courses": relate_courses,
            "video": video,
        })



