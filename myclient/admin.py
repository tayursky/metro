from django.contrib import admin
from django.contrib.auth.models import User
from django.shortcuts import render, redirect
from django import forms

from .models import Naznach, Okrug, Prioritet, Client
from myobject.models import MyObject
from .forms import ManagersForm


class UserAdmin(admin.ModelAdmin):
    list_display = ('username', 'email', 'first_name', 'last_name',
                    'is_active', 'date_joined', 'is_staff', 'last_login')
    list_filter = ('is_active',)

    def delete_view(self, request, object_id, extra_context=None):
        del_user = User.objects.get(pk=object_id)
        extra_context = {}
        extra_context['del_user'] = del_user
        extra_context['users'] = User.objects.all()
        form = ManagersForm(exclude={'id': object_id})
        extra_context['form'] = form

        if not request.POST:
            print(dir(del_user))

        if del_user.client_set.exists() or del_user.myobject_set.exists():
            if request.POST:
                if form.is_valid:
                    form = ManagersForm(request.POST)
                    del_user.is_active = False
                    del_user.client_set.update(
                        my_manager=User.objects.get(pk=form.data['managers'])
                    )
                    del_user.myobject_set.update(
                        my_manager=User.objects.get(pk=form.data['managers'])
                    )
                    del_user.save()
                    return redirect('/admin/auth/user')
            return render(request, 'admin/delete_user.html', extra_context)
        else:
            return super(UserAdmin, self).\
                delete_view(request, object_id, extra_context=extra_context)

admin.site.unregister(User)
admin.site.register(User, UserAdmin)

admin.site.register(Client)
admin.site.register(Prioritet)
admin.site.register(Naznach)
admin.site.register(Okrug)
