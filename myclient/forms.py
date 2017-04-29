# -*- coding: utf-8 -*-
from django import forms
from django.contrib.auth.models import User
from .models import Client

# Форма добавления клиента


class ClientForm(forms.ModelForm):
    class Meta:
        model = Client
        fields = ('name', 'tel')
