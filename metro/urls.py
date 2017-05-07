"""metro URL Configuration
"""
from django.conf.urls import url, include
from django.contrib import admin
from django.conf.urls.static import static
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.conf import settings
from . import views
urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', views.home, name="home"),
    url(r'^login/client/', include('myclient.urls')),
    url(r'^login/object/', include('myobject.urls')),
    url(r'^login/task/', include('mytask.urls')),
    url(r'^login/search/', include('search.urls')),
    url(r'^accounts/', include('allauth.urls')),

] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
