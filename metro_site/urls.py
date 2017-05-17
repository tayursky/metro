from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.home, name='home'),

    # Поиск в админке
    url(r'^search_object/$', views.search_object, name='search_object'),
    url(r'^search_metro/$', views.search_metro, name='search_metro'),
]
