# encoding: utf-8
__author__ = 'mark'
__date__ = '2018/3/11 16:41'

import xadmin
from xadmin import views
from .models import EmailVerifyRecord,Banner,LoginBanner


#主题功能开启
class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True

class GlobalSettings(object):
    site_title = "iLearn在线后台管理"
    site_footer = "mark-iLearm"
    # 收起菜单
    menu_style = "accordion"

class EmailVerifyRecordAdmin(object):
    list_display = ['code', 'email', 'send_type', 'send_time','is_active']
    search_fields = ['code', 'email', 'send_type','is_active']
    list_filter = ['code', 'email', 'send_type', 'send_time','is_active']


class BannerAdmin(object):
    list_display = ['title', 'image', 'url', 'index','add_time']
    search_fields =  ['title', 'image', 'url', 'index']
    list_filter =  ['title', 'image', 'url', 'index','add_time']

class LoginBannerAdmin(object):
    list_display = ['title', 'image', 'url', 'index','add_time']
    search_fields =  ['title', 'image', 'url', 'index']
    list_filter =  ['title', 'image', 'url', 'index','add_time']

xadmin.site.register(Banner,BannerAdmin)
xadmin.site.register(LoginBanner,LoginBannerAdmin)
xadmin.site.register(EmailVerifyRecord,EmailVerifyRecordAdmin)
xadmin.site.register(views.BaseAdminView,BaseSetting)
xadmin.site.register(views.CommAdminView, GlobalSettings)

