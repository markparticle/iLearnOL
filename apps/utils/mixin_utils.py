# encoding: utf-8
__author__ = 'mark'
__date__ = '2018/3/16 0:39'

from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator


class LoginRequiredMixin(object):   #基础view

    @method_decorator(login_required(login_url='/login/'))   #装饰器
    def dispatch(self,request,*args,**kwargs):
        return super(LoginRequiredMixin,self).dispatch(request,*args,**kwargs)  #仅仅是为了调用装饰器



