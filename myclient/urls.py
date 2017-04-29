from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^my-client/$', views.my_client, name='my_client'),
    url(r'^add-client/$', views.add_client, name='add_client'),

    url(r'^my-object/$', views.my_object, name='my_object'),
    url(r'^add-object/$', views.add_object, name='add_object'),

    url(r'^my-task/$', views.my_task, name='my_task'),
    url(r'^add-task/$', views.add_task, name='add_task'),
]
