# -*- coding: utf-8 -*-
from django import forms
from .models import Contact

class ContactForm(forms.ModelForm):
    ''' Форма обратной связи '''
    class Meta:
        model = Contact
        fields = ('name', 'tel', 'email', 'message')

class SZvonId(forms.Form):
    ''' Форма поиска по id '''
    search = forms.CharField(label='', widget=forms.TextInput(attrs={'placeholder': '', 'class': 'id_s'}), max_length=30, error_messages={'required': ''})

class SZvonName(forms.Form):
    ''' Форма поиска по имени '''
    search = forms.CharField(label='', widget=forms.TextInput(attrs={'placeholder': '', 'class': 'id_s'}), max_length=30, error_messages={'required': ''})
