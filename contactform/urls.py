from django.conf.urls import url

from contactform import views

urlpatterns = [
	url(r'^$', views.contact, name='contact'),
	url(r'^login/contact/$', views.ZayavkaList.as_view(), name='zayavka'),
	url(r'^update_zayavka/(?P<pk>[0-9]+)/$', views.ZayavkaUpdate.as_view(), name='update_zayavka'),
	url(r'^delete_zayavka/(?P<pk>[0-9]+)/$', views.ZayavkaDelete.as_view(), name='delete_zayavka'),
]
