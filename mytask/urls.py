from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.my_task, name='my_task'),
    url(r'^add-task/$', views.add_task, name='add_task'),
]
