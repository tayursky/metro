# -*- coding: utf-8 -*-
from django import forms
from .models import MyObject

class MyObjectForm(forms.ModelForm):
    class Meta:
        model = MyObject
        fields = ('type_obj', 'okrug', 'naznach', 'station_one', 'station_two')
        widgets = {
            'okrug': forms.widgets.CheckboxSelectMultiple,
            #'naznach': forms.widgets.CheckboxSelectMultiple
        }
