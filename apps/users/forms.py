# encoding: utf-8
__author__ = 'mark'
__date__ = '2018/3/12 12:05'
from django import forms
from captcha.fields import CaptchaField

from .models import UserProfile

class LoginForm(forms.Form):
    # 用户名密码不能为空
    username = forms.CharField(required=True)
    password = forms.CharField(required=True, min_length=5)

class CaptchaForm(forms.Form):
    captcha = CaptchaField()

class RegisterForm(forms.Form):
    email = forms.EmailField(required=True)
    password1 = forms.CharField(required=True, min_length=5)
    password2 = forms.CharField(required=True, min_length=5)
    captcha = CaptchaField(error_messages={'invalid':'验证码输入错误'})

class ForgetForm(forms.Form):
    email = forms.EmailField(required=True)
    captcha = CaptchaField(error_messages={"invalid": u"验证码错误"})

class ModifyPwdForm(forms.Form):
    password1 = forms.CharField(required=True, min_length=5)
    password2 = forms.CharField(required=True, min_length=5)




class UploadImageForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['image']



class UserInfoForm(forms.ModelForm):

    class Meta:
        model = UserProfile
        fields = ['nick_name','gender','birthday','address','mobile']
