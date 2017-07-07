from django.conf.urls import url
from . import views


urlpatterns = [
    #  url(r'^$', views.HomeView.as_view(), name='home'),
    url(r'^$', views.home, name='home'),
    url(r'new/$', views.new_obj, name='new_obj'),

    # Поиск на сайте
    url(r'^search_object/$', views.search_object, name='search_object'),
    url(r'^search_metro/$', views.search_metro, name='search_metro'),
    url(r'^object-single/(?P<pk>[0-9]+)/$',
        views.obj_single, name='obj_single'),
]
