from django.conf.urls import url
from black_list import views

urlpatterns = [
    url(r'^$', views.BlackListViews.as_view(), name="black_list"),
    url(r'^add/$', views.BlackListCreate.as_view(), name="add_black_list"),
    url(r'^update/(?P<pk>[0-9]+)/$',
        views.BlackListUpdate.as_view(),
        name="update_black_list"),
    url(r'^delete_b_l/$', views.del_black_list, name='del_black_list'),
]
