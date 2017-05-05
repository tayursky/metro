from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.my_client, name='my_client'),
    url(r'^add-client/$', views.add_client, name='add_client'),
    url(r'^hide/(?P<pk>\d+)/$', views.hide_client, name='hide_client'),
    url(r'^show/(?P<pk>\d+)/$', views.show_client, name='show_client'),
    url(r'^update_client/(?P<pk>[0-9]+)/$', views.ClientUpdate.as_view(), name='update_client'),
    url(r'^delete_client/(?P<pk>[0-9]+)/$', views.ClientDelete.as_view(), name='delete_client'),
    url(r'^add/task_client/(?P<pk>[0-9]+)/$',
        views.AddTaskClient.as_view(), name='add_task_client'),
    url(r'^copy_client/(?P<pk>[0-9]+)/$', views.ClientCopy.as_view(), name='copy_client'),
]
