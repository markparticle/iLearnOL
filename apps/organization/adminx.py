# encoding: utf-8
__author__ = 'mark'
__date__ = '2018/3/11 19:48'

# encoding: utf-8
__author__ = 'mark'
__date__ = '2018/3/11 19:32'


import xadmin
from .models import CityDict,CourseOrg,Teacher

class CityDictAdmin(object):
    list_display = ['name', 'desc','add_time']
    search_fields =['name', 'desc']
    list_filter = ['name', 'desc','add_time']

    model_icon = 'fa fa-home '
xadmin.site.register(CityDict,CityDictAdmin)

class CourseOrgAdmin(object):
    list_display = ['name', 'desc','add_time','click_nums','fav_nums','address','city','category']
    search_fields =['name', 'desc','click_nums','fav_nums','address','city','category']
    list_filter =['name', 'desc','add_time','click_nums','fav_nums','address','city','category']
    relfield_style = 'fk-ajax'  #下拉搜索

    readonly_fields = ['students','course_nums','click_nums','fav_nums','add_time']

xadmin.site.register(CourseOrg,CourseOrgAdmin)

class TeacherAdmin(object):
    list_display = ['name', 'work_years','work_company','points','click_nums','fav_nums','org','add_time']
    search_fields =['name', 'work_years','work_company','points','click_nums','fav_nums','org',]
    list_filter =['name', 'work_years','work_company','points','click_nums','fav_nums','org__name','add_time']


    readonly_fields = ['click_nums',  'fav_nums', 'add_time']
xadmin.site.register(Teacher,TeacherAdmin)


