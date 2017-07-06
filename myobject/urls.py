from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.my_object, name='my_object'),
    url(r'^add-object/$', views.add_object, name='add_object'),
    url(r'^hide_obj/(?P<pk>[0-9]+)/$', views.hide_obj, name='hide_obj'),
    url(r'^show_obj/(?P<pk>[0-9]+)/$', views.show_obj, name='show_obj'),
    url(r'^delete_obj/(?P<pk>[0-9]+)/$',
        views.ObjDelete.as_view(), name='delete_obj'),
    url(r'^update_obj/(?P<pk>[0-9]+)/$',
        views.ObjUpdate.as_view(), name='update_obj'),
    url(r'^copy_obj/(?P<pk>[0-9]+)/$',
        views.ObjCopy.as_view(), name='copy_obj'),
    url(r'^prozvon_obj/(?P<pk>[0-9]+)/$', views.zvon_obj, name='zvon_obj'),
    url(r'^look_obj/(?P<pk>[0-9]+)/$', views.look_obj, name='look_obj'),

    url(r'^upload-photo/$', views.upload_photo, name='upload_photo'),
    url(r'^delete/photo/(?P<pk>[0-9]+)/$', views.del_photo, name='del-photo'),
    url(r'^save-weight/$', views.save_weight, name='save-weight'),
]
