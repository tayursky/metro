from .models import Photo
from django import forms


class FileFieldForm(forms.ModelForm):
    file_field = forms.FileField(label='Фото', widget=forms.ClearableFileInput(attrs={'multiple': True}))    

    class Meta:
        model = Photo
        fields = ('station', )
