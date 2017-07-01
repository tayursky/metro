from django.conf.urls import url
from .views import *


urlpatterns = [
    url(r'^upload/$', FileFieldView.as_view(), name="photo_baza"),
    url(r'^upload_url/$', UploadURLView.as_view(), name="upload-url"),
    # url(r'^show/(?P<pk>\d+)/$',
    # UploadDetailView.as_view(), name="upload-detail"),
]
