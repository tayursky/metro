from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^my-task/$', views.my_task, name='my_task'),
]
