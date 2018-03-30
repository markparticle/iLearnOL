"""iLearnOL URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.urls import path,include,re_path
from django.views.generic import TemplateView
from django.views.static import serve
import xadmin

from users.views import LoginView,RegisterView,ActiveUserView,ForgetPwdView,ResetUserView,ModifyPwdView,LogoutView,IndexView
from organization.views import OrgView
from iLearnOL.settings import MEDIA_ROOT

urlpatterns = [
    path('xadmin/', xadmin.site.urls),
    path('',IndexView.as_view(),name='index'),

    path('login/',LoginView.as_view(),name='login'),
    path('logout/', LogoutView.as_view(), name='logout'),
    path('register/',RegisterView.as_view(),name='register'),

    #验证码
    path("captcha/", include('captcha.urls')),
    re_path('active/(?P<active_code>.*)/', ActiveUserView.as_view(), name="user_active"),
    path('forget/', ForgetPwdView.as_view(), name="forget_pwd"),
    re_path('reset/(?P<reset_code>.*)/', ResetUserView.as_view(), name="rest_pwd"),
    path('modify_pwd/', ModifyPwdView.as_view(), name="modify_pwd"),

    #配置上传文件、静态文件的处理函数
    re_path(r'^media/(?P<path>.*)', serve, {"document_root": MEDIA_ROOT}),
    # re_path(r'^static/(?P<path>.*)', serve, {"document_root": STATIC_ROOT}),

    # namespace 使用命名空间防止重复
    #课程机构与讲师url配置  url分发   #会在org目录urls下找
    path("org/", include('organization.urls', namespace="org")),

    path("courses/", include('courses.urls', namespace="courses")),

    path("users/", include('users.urls', namespace="users")),

    #富文本相关URL
    path("ueditor/", include('DjangoUeditor.urls')),
]

#全局404页面
handler404 = 'users.views.page_not_found'

#全局500页面
handler500 = 'users.views.page_error'

