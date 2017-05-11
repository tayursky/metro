# -*- coding: utf-8 -*-
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.models import User
from .models import MenagerOptions
from django.db.models.signals import post_save
from django.dispatch import receiver


# Создание менеджера
@receiver(post_save, sender = User)
def addinfo(instance, **kwargs):
	#Существует пользователь или нет
	try:
		p = MenagerOptions.objects.get(user = instance)
		return redirect('/login/task')
	except:
		post = MenagerOptions()
		post.user = instance
		post.name = instance.username
		post.save()
