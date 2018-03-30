# encoding: utf-8
__author__ = 'mark'
__date__ = '2018/3/14 10:33'
import re
from django import forms

from operation.models import UserAsk


class UserAskForm(forms.ModelForm):

    class Meta:
        model = UserAsk
        fields = ['name','mobile','course_name']

    #用正则来验证手机号码
    def clean_mobile(self):   #自定义封装
        mobile = self.cleaned_data['mobile']
        REGEX_MOBILE = "^1[358]\d{9}$|^147\d{8}$|^176\d{8}$"
        p = re.compile(REGEX_MOBILE)
        if p.match(mobile):
            return  mobile
        else:
            raise forms.ValidationError('手机号码非法',code='mobile_invalue')

