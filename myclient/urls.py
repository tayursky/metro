from django.conf.urls import url

from . import views, task, prioritet

urlpatterns = [
    # Клиенты
    url(r'^my/(?P<pk>[0-9]+)/$', views.my_client, name='my_client'),
    url(r'^add-client/$', views.add_client, name='add_client'),
    url(r'^hide/(?P<pk>[0-9]+)/$', views.hide_client, name='hide_client'),
    url(r'^show/(?P<pk>[0-9]+)/$', views.show_client, name='show_client'),
    url(r'^update_client/(?P<pk>[0-9]+)/$', views.ClientUpdate.as_view(), name='update_client'),
    url(r'^delete_client/(?P<pk>[0-9]+)/$', views.ClientDelete.as_view(), name='delete_client'),
    url(r'^copy_client/(?P<pk>[0-9]+)/$', views.ClientCopy.as_view(), name='copy_client'),

    # Задачи
    #url(r'^task/$', task.my_task, name='my_task'),
    url(r'^task/$', task.MyTaskList.as_view(), name='my_task'),
    url(r'^add/task_client/(?P<pk>[0-9]+)/$',
            task.AddTaskClient.as_view(), name='add_task_client'),
    url(r'^add/task/$', task.AddTaskClient.as_view(), name='add_task'),

    # Приоритеты
    url(r'^prioritet/$', prioritet.PrioritetList.as_view(), name='prioritet'),
    url(r'^prioritet/add/$', prioritet.AddPrioritet.as_view(), name='add_prioritet'),
    url(r'^prioritet/update/(?P<pk>[0-9]+)/$', prioritet.PrioritetUpdate.as_view(), name='update_prio'),
    #url(r'^prioritet/delete/(?P<pk>[0-9]+)/$', prioritet.PrioritetDelete.as_view(), name='delete_prio'),
    url(r'^prioritet/delete_prio/$', prioritet.del_prio, name='delete_prio'),
]
