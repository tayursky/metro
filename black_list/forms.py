from django import forms
from .models import BlackList

class BlackListForm(forms.ModelForm):
    class Meta:
        model = BlackList
        fields = ('name', 'tel', 'text')
