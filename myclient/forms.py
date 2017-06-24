# -*- coding: utf-8 -*-
from django import forms
from django.contrib.auth.models import User
from .models import Client, TaskClient, Prioritet

class ClientForm(forms.ModelForm):
    ''' Форма добавления клиента'''
    class Meta:
        model = Client
        fields = ('name', 'tel', 'email', 'naznach_one', 'naznach_two',
                  'area_ot', 'area_do', 'price_obsh', 'price_m', 'dop_kont',
                  'metro', 'adres', 'komisiya', 'etaj', 'podborka',
                  'okrug', 'type_obj')
        widgets = {
            'okrug': forms.widgets.CheckboxSelectMultiple,
        }

class HideClientForm(forms.ModelForm):
    ''' Форма скрытия клиента '''
    class Meta:
        model = Client
        fields = ('hide_date',)

class TaskClientForm(forms.ModelForm):
    ''' Форма задачи клиента '''
    class Meta:
        model = TaskClient
        fields = ('client', 'prioritet', 'date', 'task')

class PrioritetForm(forms.ModelForm):
    ''' Форма добавления приоритета '''
    class Meta:
        model = Prioritet
        fields = ('prioritet', 'num')

class SerchNameForm(forms.Form):
    ''' Форма поиска клиента по имени '''
    search = forms.CharField(label='',
                             widget=forms.TextInput(attrs={'placeholder': '',
                                                           'class': 'id_s'}),
                             max_length=30, error_messages={'required': ''})

class SCkientMenForm(forms.ModelForm):
    ''' Форма поиска клиента по менеджеру '''
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

class SCkientHideForm(forms.ModelForm):
    ''' Форма поиска клиента по полю скрыт\не скрыт '''
    class Meta:
        model = Client
        fields = ('hide', )
        labels = {
            'hide': ''
        }
        error_messages = {
            'hide': ''
        }

class SCkientNazForm(forms.ModelForm):
    ''' Форма поиска клиента по назначению '''
    class Meta:
        model = Client
        fields = ('naznach_one', )
        labels = {
            'naznach_one': ''
        }
        error_messages = {
            'naznach_one': ''
        }


class ManagersForm(forms.Form):
    '''Форма для переназначения менедежера
    при удалении из панели администратора'''

    managers = forms.ModelChoiceField(queryset=User.objects.all(),
                                     to_field_name='id')

    def __init__(self, *args, **kwargs):
        exclude_args = kwargs.pop('exclude', {})
        super(ManagersForm, self).__init__(*args, **kwargs)
        self.fields['managers'].queryset = User.objects\
            .filter(is_active=True).exclude(id__in=exclude_args)
