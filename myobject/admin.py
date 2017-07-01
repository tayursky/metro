from simple_history.admin import SimpleHistoryAdmin

from django.contrib import admin

from .models import StancMetro, MyObject


class StancMetroAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'color')

admin.site.register(MyObject, SimpleHistoryAdmin)
admin.site.register(StancMetro, StancMetroAdmin)
