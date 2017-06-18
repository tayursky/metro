# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2017-05-18 16:57
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myclient', '0003_taskclient_end'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='taskclient',
            options={'ordering': ['-prioritet'], 'verbose_name': 'Задача клиента', 'verbose_name_plural': 'Задачи клиента'},
        ),
        migrations.AlterField(
            model_name='taskclient',
            name='prioritet',
            field=models.CharField(blank=True, choices=[('0', 'другое'), ('1', 'звонок, ответ'), ('2', 'встреча, показ'), ('3', 'первоочередное')], default='0', max_length=30, verbose_name='Приоритет'),
        ),
    ]