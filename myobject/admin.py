from simple_history.admin import SimpleHistoryAdmin

from django.contrib import admin

from .models import StancMetro, MyObject


admin.site.register(MyObject, SimpleHistoryAdmin)
admin.site.register(StancMetro)
