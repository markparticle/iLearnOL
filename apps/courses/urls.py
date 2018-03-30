# encoding: utf-8
__author__ = 'mark'
__date__ = '2018/3/14 10:41'

from django.urls import path,include,re_path

from .views import CourseListView,CourseDateilView,CourseInfoView,CourseCommentsView,AddComentsView,VideoPlayView

app_name = "courses"

urlpatterns = [
    #课程列表页
    path('list/', CourseListView.as_view(), name="course_list"),

    #课程详情页
    re_path('detail/(?P<course_id>\d+)/', CourseDateilView.as_view(), name='course_detail'),

    # 课程详情页
    re_path('info/(?P<course_id>\d+)/', CourseInfoView.as_view(), name='course_info'),

    # 课程评论
    re_path('comments/(?P<course_id>\d+)/', CourseCommentsView.as_view(), name="course_comments"),

    #添加课程评论
    path('add_comment/', AddComentsView.as_view(), name="add_comment"),

    # 视频播放
    re_path('video/(?P<video_id>\d+)/', VideoPlayView.as_view(), name="video_play"),
]