from django import forms
from .models import BlackList


class BlackListForm(forms.ModelForm):
    ''' Форма добовления в клиентов черный список '''
    class Meta:
        model = BlackList
        fields = ('name', 'tel', 'text')
