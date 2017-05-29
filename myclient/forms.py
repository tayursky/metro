# -*- coding: utf-8 -*-
from django import forms
from django.contrib.auth.models import User
from .models import Client, TaskClient, Prioritet

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

# Форма добавления приоритета
class PrioritetForm(forms.ModelForm):
    class Meta:
        model = Prioritet
        fields = ('prioritet', 'num')

# Форма поиска клиента по имени
class SerchNameForm(forms.Form):
    search = forms.CharField(label='', widget=forms.TextInput(attrs={'placeholder': '', 'class': 'id_s'}), max_length=30, error_messages={'required': ''})

# Форма поиска клиента по менеджеру
class SCkientMenForm(forms.ModelForm):
    class Meta:
        model = Client
        fields = ('my_manager', )
        labels = {
            'my_manager': ''
        }
        error_messages = {
            'my_manager': ''
        }
        '''fields_classes = {
            'my_manager': 'id_s'
        }'''

# Форма поиска клиента по полю скрыт\не скрыт
class SCkientHideForm(forms.ModelForm):
    class Meta:
        model = Client
        fields = ('hide', )
        labels = {
            'hide': ''
        }
        error_messages = {
            'hide': ''
        }

# Форма поиска клиента по назначению
class SCkientNazForm(forms.ModelForm):
    class Meta:
        model = Client
        fields = ('naznach_one', )
        labels = {
            'naznach_one': ''
        }
        error_messages = {
            'naznach_one': ''
        }
