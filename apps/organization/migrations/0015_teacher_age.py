# Generated by Django 2.0.3 on 2018-03-16 11:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0014_auto_20180315_0004'),
    ]

    operations = [
        migrations.AddField(
            model_name='teacher',
            name='age',
            field=models.IntegerField(default='25', verbose_name='年龄'),
        ),
    ]