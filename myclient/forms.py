# -*- coding: utf-8 -*-
from django import forms
from django.contrib.auth.models import User
from .models import Client, TaskClient

# Форма добавления клиента


class ClientForm(forms.ModelForm):
    class Meta:
        model = Client
        fields = ('name', 'tel', 'email', 'naznach_one', 'naznach_two',
                  'area_ot', 'area_do', 'price_obsh', 'price_m', 'dop_kont', 'metro', 'adres', 'komisiya', 'etaj', 'podborka', 'okrug', 'type_obj')
        widgets = {
            'okrug': forms.widgets.CheckboxSelectMultiple,
        }

# Форма скрытия клиента


class HideClientForm(forms.ModelForm):
    class Meta:
        model = Client
        fields = ('hide_date',)

# Форма задачи клиента


class TaskClientForm(forms.ModelForm):
    class Meta:
        model = TaskClient
        fields = ('client', 'prioritet', 'date', 'task')
