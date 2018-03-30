# encoding: utf-8
__author__ = 'mark'
__date__ = '2018/3/11 19:32'


import xadmin
from .models import UserAsk,CourseComments,UserFavorite,UserMessage,UserCourse

class UserCourseAdmin(object):
    list_display = ['user', 'course', 'add_time']
    search_fields = ['user', 'course',]
    list_filter = ['user', 'course', 'add_time']
    model_icon = 'fa fa-pencil '

xadmin.site.register(UserCourse, UserCourseAdmin)


class UserAskAdmin(object):
    list_display = ['name', 'mobile', 'course_name','add_time']
    search_fields =['name', 'mobile', 'course_name']
    list_filter = ['name', 'mobile', 'course_name','add_time']
xadmin.site.register(UserAsk,UserAskAdmin)

class CourseCommentsAdmin(object):
    list_display = ['user', 'course', 'comments', 'add_time']
    search_fields =['user', 'course', 'comments',]
    list_filter = ['user', 'course', 'comments', 'add_time']

xadmin.site.register(CourseComments,CourseCommentsAdmin)

class UserFavoriteAdmin(object):
    list_display = ['user', 'add_time','fav_id','fav_type']
    search_fields =  ['user','fav_id','fav_type']
    list_filter =  ['user', 'add_time','fav_id','fav_type']

xadmin.site.register(UserFavorite, UserFavoriteAdmin)


class UserMessageAdmin(object):
    list_display = ['user', 'message',  'add_time','has_read']
    search_fields = ['user', 'message','has_read']
    list_filter = ['user', 'message','add_time','has_read']

xadmin.site.register(UserMessage, UserMessageAdmin)



