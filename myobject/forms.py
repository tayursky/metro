# -*- coding: utf-8 -*-
from django import forms
from .models import MyObject

class MyObjectForm(forms.ModelForm):
    class Meta:
        model = MyObject
        fields = ('typeobj', 'okrug', 'adres', 'naznach', 'area', 'block_area', 'etaj', 'price', 'opis', 'station_one',
         'station_two', 'dom', 'kvt', 'dogovor', 'block_tel', 'silka','zametka')
        widgets = {
            'okrug': forms.widgets.CheckboxSelectMultiple,
            'naznach': forms.widgets.CheckboxSelectMultiple
        }

# Форма поиска объекта по типу
class SObjectTypeForm(forms.ModelForm):
    class Meta:
        model = MyObject
        fields = ('typeobj', )
        labels = {
            'typeobj': ''
        }
        error_messages = {
            'typeobj': ''
        }
        '''fields_classes = {
            'typeobj': 'id_s'
        }'''

# Форма поиска объекта по станции метро
class SObjectMetroForm(forms.ModelForm):
    class Meta:
        model = MyObject
        fields = ('station_one', )
        labels = {
            'station_one': ''
        }
        error_messages = {
            'station_one': ''
        }

# Форма поиска объекта по станции метро
class SObjectHideForm(forms.ModelForm):
    class Meta:
        model = MyObject
        fields = ('hide', )
        labels = {
            'hide': ''
        }
        error_messages = {
            'hide': ''
        }
