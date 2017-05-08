from django.conf.urls import url

from . import views

urlpatterns = [
    # Поиск в админке
    url(r'^search_object/$', views.search_object, name='search_object'),
    url(r'^search_adres/$', views.search_adres, name='search_adres'),
    url(r'^search_client/$', views.search_client, name='search_client'),
    url(r'^search_metro/$', views.search_metro, name='search_metro'),
    url(r'^search_vlad/$', views.search_vlad, name='search_vlad'),
]
