from django.shortcuts import render
from django.views.generic.edit import FormView
from .forms import FileFieldForm
from .models import Photo

class FileFieldView(FormView):
    '''Добавление фото в Фото базу'''
    form_class = FileFieldForm
    template_name = 'photo_baza/upload.html'
    success_url = '/photo/upload/'  # Replace with your URL or reverse().

    def post(self, request, *args, **kwargs):
        form_class = self.get_form_class()
        form = self.get_form(form_class)
        files = request.FILES.getlist('file_field')
        if form.is_valid():
            station_id = request.POST['station']
            for f in files:
                one_image = Photo(station_id=station_id, image=f)
                one_image.save()
            return self.form_valid(form)
        else:
            return self.form_invalid(form)
