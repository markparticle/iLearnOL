# encoding: utf-8
__author__ = 'mark'
__date__ = '2018/3/11 19:23'

import xadmin
from .models import Course,Lesson,Video,CourseResource,BannerCourse
from organization.models import CourseOrg

# #嵌套编辑
# class LessonInline(object):
#     model = Lesson
#     extra = 0
# class CourseResourceInline(object):
#     model = CourseResource
#     extra = 0

class BannerCourseAdmin(object):
    list_display = ['name', 'desc', 'detail', 'learn_times','students','fav_nums','click_nums','add_time']
    search_fields = ['name', 'desc', 'detail', 'learn_times','students','fav_nums','click_nums',]
    list_filter = ['name', 'desc', 'detail', 'learn_times','students','fav_nums','click_nums','add_time']
    ordering = ['-click_nums']
    readonly_fields = ['click_nums','fav_nums']

    # exlude = ['click_nums']
    # inlines = [LessonInline, CourseResourceInline]

    def queryset(self):
        qs = super(BannerCourseAdmin, self).queryset()
        qs = qs.filter(is_banner=True)
        return qs

class CourseAdmin(object):
    list_display = ['name', 'desc', 'detail', 'learn_times','degree','students','fav_nums','get_chapter_nums','go_to']
    search_fields = ['name', 'desc', 'detail', 'learn_times','degree','students','fav_nums','click_nums',]
    list_filter = ['name', 'desc', 'detail', 'learn_times','degree','students','fav_nums','click_nums','add_time',]
    ordering = ['-click_nums']
    list_editable = ['degree','desc']
    readonly_fields = ['click_nums','fav_nums']
    #指名detail用ueditor样式
    style_fields = {'detail':'ueditor'}

    model_icon = 'fa fa-book'

    #设置后台列表页面字段统计
    aggregate_fields = {'students': 'sum'}
    # #定时刷新
    # refresh_times = [3,5]
    # #隐藏
    # exlude = ['click_nums']
    # #联合数据修改 单层
    # inlines = [LessonInline, CourseResourceInline]

    #分开管理轮播课程  admin中重载queryset方法
    def queryset(self):
        qs = super(CourseAdmin, self).queryset()
        qs = qs.filter(is_banner=False)
        return qs

    #保存课程时统计机构课程数
    def save_models(self):
        obj = self.new_obj
        obj.save()

        if obj.course_org is not None:
            course_org = obj.course_org
            course_org.course_nums = Course.objects.filter(course_org=course_org).count()
            course_org.save()

    # 加入excrl导入插件
    # import_excel = True
    # def post(self, request, *args , **kwargs):
    #     if 'excel' in request.FILES:
    #         pass
    #     return super(CourseAdmin, self).post(request, args, kwargs)

class LessonAdmin(object):
    list_display = ['course', 'name', 'add_time']
    search_fields = ['course', 'name', ]
    list_filter = ['course__name', 'name', 'add_time']


class VideoAdmin(object):
    list_display = ['lesson', 'name', 'add_time']
    search_fields = ['lesson', 'name', ]
    list_filter = ['lesson', 'name', 'add_time']



class CourseResourceAdmin(object):
    list_display = ['course', 'name', 'add_time']
    search_fields = ['course', 'name', ]
    list_filter = ['course__name', 'name', 'add_time']

xadmin.site.register(Course,CourseAdmin)
xadmin.site.register(Lesson, LessonAdmin)
xadmin.site.register(CourseResource, CourseResourceAdmin)
xadmin.site.register(Video, VideoAdmin)
xadmin.site.register(BannerCourse,BannerCourseAdmin)