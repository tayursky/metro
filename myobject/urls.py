from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^my-object/$', views.my_object, name='my_object'),
    url(r'^add-object/$', views.add_object, name='add_object'),
]
