# Generated by Django 2.0.3 on 2018-03-15 00:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0012_auto_20180315_0003'),
    ]

    operations = [
        migrations.AlterField(
            model_name='courseorg',
            name='address',
            field=models.CharField(default='', max_length=160, verbose_name='所在地址'),
        ),
    ]