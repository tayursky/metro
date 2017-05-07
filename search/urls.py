from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^search_client/$', views.search_client, name='search_client'),
]
