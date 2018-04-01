from django.db import models
from datetime import datetime
# Create your models here.


class CityDict(models.Model):
    name = models.CharField(max_length=20,verbose_name='城市')
    desc = models.CharField(max_length=200,verbose_name='描述')
    add_time =models.DateTimeField(default=datetime.now,verbose_name='添加时间')

    class Meta:
        verbose_name='城市'
        verbose_name_plural = verbose_name
    def __str__(self):
        return self.name

class CourseOrg(models.Model):
    name = models.CharField(max_length=50,verbose_name='机构名称')
    desc = models.TextField(verbose_name='描述')
    category = models.CharField(max_length=50,choices=(('agency ','培训机构'),('person','个人'),('college','高校')),verbose_name='机构类别',default='Agency')
    click_nums = models.IntegerField(default=0,verbose_name='点击数')
    fav_nums = models.IntegerField(default=0,verbose_name='收藏数')
    image = models.ImageField(upload_to='org/%Y/%m',verbose_name='Logo',blank=True,null=True)
    city = models.ForeignKey(CityDict,verbose_name='所在城市',on_delete=models.CASCADE)
    address = models.CharField(max_length=160,verbose_name='所在地址')
    students = models.IntegerField(default=0,verbose_name='学习人数')
    course_nums = models.IntegerField(default=0,verbose_name='课程数')
    tag = models.CharField(default='全国知名',max_length=10,verbose_name='机构标签')
    add_time = models.DateTimeField(default=datetime.now,verbose_name='添加时间')

    #获取课程机构教师的数量
    def get_teacher_nums(self):
        return self.teacher_set.all().count()

    class Meta:
        verbose_name='机构信息'
        verbose_name_plural = verbose_name
    def __str__(self):
        return self.name

class Teacher(models.Model):
    org =models.ForeignKey( CourseOrg,verbose_name='所属机构',on_delete=models.CASCADE,)
    name = models.CharField(max_length=20, verbose_name='讲师名')
    age =  models.IntegerField(default='25',verbose_name='年龄')
    work_years = models.IntegerField(default='0',verbose_name='工作年限')
    work_company = models.CharField(max_length=50,verbose_name='就职公司/高校')
    work_postion = models.CharField(max_length=50,verbose_name='职务')
    points =models.CharField(max_length=50,verbose_name='教学特点')
    click_nums = models.IntegerField(default=0,verbose_name='点击数')
    fav_nums = models.IntegerField(default=0,verbose_name='收藏数')
    image = models.ImageField(upload_to='teacher/%Y/%m',verbose_name='教师头像',null=True,blank=True)
    add_time = models.DateTimeField(default=datetime.now, verbose_name='添加时间')

    class Meta:
        verbose_name='教师信息'
        verbose_name_plural = verbose_name
    def __str__(self):
        return '{0}老师'.format(self.name)

    def get_course_nums(self):
        return self.course_set.all().count()