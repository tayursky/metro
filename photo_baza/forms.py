from .models import Photo
from django import forms
from .utils import *


class FileFieldForm(forms.ModelForm):
    """ Форма загрузки одного или нескольких изображений """

    file_field = forms.FileField(label='Фото',
                                 widget=forms.ClearableFileInput(
                                     attrs={'multiple': True}))

    class Meta:
        model = Photo
        fields = ('station', )


class UploadURLForm(forms.ModelForm):
    """ Форма загрузки изображения по URL """
    url = forms.URLField(required=True,
                         error_messages={
                             "required": "Пожалуйста, введите URL-адрес,\
                             указывающий на файл \
                             с изображением (.jpg .jpeg .png)"},
                         )

    class Meta:
        model = Photo
        fields = ('station', )

    def clean_url(self):
        url = self.cleaned_data['url'].lower()
        domain, path = split_url(url)
        if not valid_url_extension(url) or not valid_url_mimetype(url):
            raise forms.ValidationError(
                "Пожалуйста, введите правильный \
                URL-адрес, указывающий на файл \
                с изображением (.jpg/.jpeg/.png)")
        return url
