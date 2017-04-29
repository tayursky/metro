from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^my-client/$', views.my_client, name='my_client'),
    url(r'^my-object/$', views.my_object, name='my_object'),
    url(r'^my-task/$', views.my_task, name='my_task'),
]
