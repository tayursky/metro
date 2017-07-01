from django.shortcuts import render
from django.views.generic.edit import FormView
from django.views.generic import DetailView
from .forms import FileFieldForm
from .models import Photo
from .forms import UploadURLForm
from .utils import *
from django.contrib.messages.views import SuccessMessageMixin


class FileFieldView(FormView):
    """
    Загрузка одного или нескольких изображений
    с локального компьютера пользователя
    """
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


class UploadURLView(SuccessMessageMixin, FormView):
    """
    Загрузка  изображения по URL адресу
    """
    form_class = UploadURLForm
    template_name = "photo_baza/upload_from_url.html"
    success_url = '/photo/upload_url/'

#    def get_success_url(self):
#        return reverse("upload-detail", args=[self.image_from_url.pk, ])

    def form_valid(self, form):
        def _invalidate(msg):
            form.errors['url'] = [msg, ]
            return super(UploadURLView, self).form_invalid(form)

        url = form.data['url']
        messege_id = form.data['station']
        domain, path = split_url(url)
        filename = get_url_tail(path)

        # Скачивание изображения с сервера по url-адресу
        fobject = retrieve_image(url)
        if not fobject:
            return _invalidate("Ошибка url-адреса")

        # Проверка файла на допустимые расширения изображений
        pil_image = Image.open(fobject[0])
        if pil_image.format.lower() not in VALID_IMAGE_EXTENSIONS:
            return _invalidate("Файл не является изображением")

        django_file = pil_to_django(pil_image)

        # Привязка изображения к модели Photo
        self.uploaded_image = Photo(station_id=messege_id)
        self.uploaded_image.image.save(filename, django_file)
        self.uploaded_image.save()
#        success_message ='Фотография добавлена'

        return super(UploadURLView, self).form_valid(form)


class UploadDetailView(DetailView):
    model = Photo
    context_object_name = "image"
    template_name = "photo_baza/detail.html"
