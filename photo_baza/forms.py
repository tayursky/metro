from .models import Photo
from django import forms
from .utils import *

class FileFieldForm(forms.ModelForm):
    file_field = forms.FileField(label='Фото',         widget=forms.ClearableFileInput(attrs={'multiple': True}))

    class Meta:
        model = Photo
        fields = ('station', )

class UploadURLForm(forms.ModelForm):
    url = forms.URLField(required=True,
        error_messages={
            "required": "Please enter a valid URL to an image (.jpg .jpeg .png)"
            },
        )

    class Meta:
        model = Photo
        fields = ('station', )

    def clean_url(self):
        url = self.cleaned_data['url'].lower()
        domain, path = split_url(url)
        if not valid_url_extension(url) or not valid_url_mimetype(url):
            raise forms.ValidationError("Not a valid Image. The URL must have an image extensions (.jpg/.jpeg/.png)")
        return url
