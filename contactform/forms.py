# -*- coding: utf-8 -*-
from django import forms
from .models import Contact

#Форма обратной связи
class ContactForm(forms.ModelForm):
    class Meta:
        model = Contact
        fields = ('name', 'tel', 'email', 'message')

# Форма поиска по id
class SZvonId(forms.Form):
    search = forms.CharField(label='', widget=forms.TextInput(attrs={'placeholder': '', 'class': 'id_s'}), max_length=30, error_messages={'required': ''})

# Форма поиска по имени
class SZvonName(forms.Form):
    search = forms.CharField(label='', widget=forms.TextInput(attrs={'placeholder': '', 'class': 'id_s'}), max_length=30, error_messages={'required': ''})
