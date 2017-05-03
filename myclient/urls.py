from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.my_client, name='my_client'),
    url(r'^add-client/$', views.add_client, name='add_client'),
]
