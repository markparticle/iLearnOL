from django.db import models
from datetime import datetime

# Create your models here.
from django.contrib.auth.models import AbstractUser


class UserProfile(AbstractUser):
    nick_name = models.CharField(max_length=50,verbose_name='昵称',default='还没想好名字')
    birthday = models.DateField(verbose_name='生日',null=True,blank=True,)
    gender = models.CharField(max_length=6,choices=(('male','男'),('female','女')),verbose_name='性别',default='')
    address = models.CharField(max_length=100,default='',verbose_name='地址')
    mobile = models.CharField(max_length=11,null=True,blank=True,verbose_name='电话号码')
    image = models.ImageField(upload_to='image/%Y/%m',default='image/2018/04/default.png',verbose_name='用户头像',blank=True,null=True)
    add_time = models.DateTimeField(default=datetime.now, verbose_name='注册时间')

    class Meta:         #后台栏目名
        verbose_name= '用户信息'
        verbose_name_plural = verbose_name  #复数形式

    def __str__(self):
        return self.username

    #读取未读消息数
    def unread_nums(self):
        from operation.models import UserMessage   #只有调用的时候才会引用
        return UserMessage.objects.filter(user=self.id,has_read=False).count()


class EmailVerifyRecord(models.Model):
    code = models.CharField(max_length=100,verbose_name='验证码')
    email = models.EmailField(max_length=50,verbose_name='邮箱')
    send_type = models.CharField(choices=(('register','注册'),('forget','忘记密码'),('update_eamil','修改邮箱')),max_length=50 ,verbose_name='验证类型')
    send_time = models.DateTimeField(default=datetime.now,verbose_name='发送时间')  #实例化时的时间  datetime.now()创建类的时候时间
    is_active = models.BooleanField(default=True)
    class Meta:
        verbose_name='邮箱验证码'
        verbose_name_plural = verbose_name

    def __str__(self):
        return '{0}({1})'.format(self.code,self.email)


class Banner(models.Model):
    title = models.CharField(max_length=100,verbose_name='标题')
    image = models.ImageField(upload_to='banner/%Y/%m',verbose_name='轮播图',max_length=50,blank=True,null=True)
    url = models.URLField(max_length=200,verbose_name='访问地址')
    index = models.IntegerField(default=1,verbose_name='顺序')
    add_time = models.DateTimeField(default=datetime.now,verbose_name='添加时间')

    class Meta:
        verbose_name = '轮播图'
        verbose_name_plural = verbose_name
    def __str__(self):
        return self.title

class LoginBanner(models.Model):
    title = models.CharField(max_length=100,verbose_name='标题')
    image = models.ImageField(upload_to='banner/%Y/%m',verbose_name='轮播图',max_length=50,blank=True,null=True)
    url = models.URLField(max_length=200,verbose_name='访问地址')
    index = models.IntegerField(default=1,verbose_name='顺序')
    add_time = models.DateTimeField(default=datetime.now,verbose_name='添加时间')

    class Meta:
        verbose_name = '登录轮播图'
        verbose_name_plural = verbose_name
    def __str__(self):
        return self.title
