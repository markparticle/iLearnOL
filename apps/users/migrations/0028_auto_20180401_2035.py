# Generated by Django 2.0.3 on 2018-04-01 20:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0027_auto_20180330_1055'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userprofile',
            name='image',
            field=models.ImageField(blank=True, default='image/2018/04/default.png', null=True, upload_to='image/%Y/%m', verbose_name='用户头像'),
        ),
    ]