# encoding: utf-8
__author__ = 'mark'
__date__ = '2018/3/27 9:11'

from django.urls import path,include,re_path

from .views import UserInfoView,UploadImageView,UpdatePwdView,UpdateEmailView,SendEmailCodeView
from .views import MyCourseView,MyFavOrgView,MyFavTeacherView,MyFavCourseView,MymessageView
app_name = "users"

urlpatterns = [
    #用户信息
    path('info/', UserInfoView.as_view(), name="user_info"),

    #用户头像上次
    path('image/upload/',UploadImageView.as_view(),name='image_upload'),

    #个人中心修改密码
    path('update/pwd/',UpdatePwdView.as_view(),name='update_pwd'),

    # 邮箱验证码
    path('sendemail_code/', SendEmailCodeView.as_view(), name='sendemail_code'),

    # 邮箱修改
    path('update_email/', UpdateEmailView.as_view(), name='update_email'),

    #我的课程
    path('mycourse/',MyCourseView.as_view(),name='mycourse'),

    # 我收藏的机构
    path('myfav/org/', MyFavOrgView.as_view(), name='myfav_org'),

    # 我收藏的讲师
    path('myfav/teacher/', MyFavTeacherView.as_view(), name='myfav_teacher'),

    # 我收藏的课程
    path('myfav/course/', MyFavCourseView.as_view(), name='myfav_course'),

    # 我的消息
    path('mymessage/course/', MymessageView.as_view(), name='mymessage'),
]