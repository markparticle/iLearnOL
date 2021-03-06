# Generated by Django 2.0.3 on 2018-03-13 21:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0004_auto_20180313_2105'),
    ]

    operations = [
        migrations.AlterField(
            model_name='courseorg',
            name='category',
            field=models.CharField(choices=[('Agency ', '培训机构'), (' Person', '个人'), ('College', '高校')], default='Agency', max_length=50, verbose_name='机构类别'),
        ),
        migrations.AlterField(
            model_name='courseorg',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='org/%Y/%m', verbose_name='Logo'),
        ),
    ]
