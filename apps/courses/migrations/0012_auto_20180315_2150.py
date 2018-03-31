# Generated by Django 2.0.3 on 2018-03-15 21:50

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0011_course_teacher'),
    ]

    operations = [
        migrations.AddField(
            model_name='course',
            name='course_know',
            field=models.CharField(default='', max_length=300, verbose_name='课程须知'),
        ),
        migrations.AddField(
            model_name='course',
            name='teacher_tell',
            field=models.CharField(default='', max_length=300, verbose_name='老师告诉你'),
        ),
    ]