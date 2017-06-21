from itertools import chain

from simple_history.admin import SimpleHistoryAdmin

from django.contrib import admin
from django.contrib.auth.models import User
from django.shortcuts import render, redirect
from django.contrib.auth.admin import UserAdmin
from django.conf import settings
from django.contrib.contenttypes.models import ContentType
from django.utils.text import capfirst
from django.utils.translation import ugettext as _
from django.utils.encoding import force_text
from django.utils.html import format_html
from django.http import Http404
from django.conf.urls import url

from .models import Naznach, Okrug, Prioritet, Client
from myobject.models import MyObject
from .forms import ManagersForm


USER_NATURAL_KEY = tuple(
    key.lower() for key in settings.AUTH_USER_MODEL.split('.', 1))


class UserAdmin(UserAdmin):

    def __init__(self, *args, **kwargs):
         super(UserAdmin,self).__init__(*args, **kwargs)
         UserAdmin.list_display = list(
             UserAdmin.list_display) + ['date_joined', 'is_active', 'last_login', 'history_link']
         UserAdmin.list_filter = ('is_active',)

    def get_actions(self, request):
        actions = super(UserAdmin, self).get_actions(request)
        del actions['delete_selected']
        return actions

    actions = ['delete_managers_action']

    def delete_managers_action(self, request, queryset):
        form = ManagersForm(exclude=queryset.values('id'))

        manager_ids = queryset.filter(is_active=True)\
            .values_list('id', flat=True)

        if 'do_action' in request.POST:
            if form.is_valid:
                form = ManagersForm(request.POST)
                Client.objects.filter(my_manager__in=manager_ids)\
                    .update(my_manager=
                            User.objects.get(pk=form.data['managers']))
                MyObject.objects.filter(my_manager__in=manager_ids)\
                    .update(my_manager=
                            User.objects.get(pk=form.data['managers']))

                queryset.update(is_active=False)

                return
        else:
            form = ManagersForm(exclude=queryset.values('id'))

        return render(request,
                      'admin/delete_users.html',
                      {'managers': queryset.filter(is_active=True),
                       'form': form})


    def delete_view(self, request, object_id, extra_context=None):
        del_user = User.objects.get(pk=object_id)
        extra_context = {}
        extra_context['del_user'] = del_user
        extra_context['users'] = User.objects.all()
        # NOTE ugly solution
        form = ManagersForm(exclude=User.objects.filter(pk=object_id))
        extra_context['form'] = form

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

    def history_link(self, obj):
        if obj.history_client.all() or obj.history_object.all():
            return format_html('<a href="/{}/{}/{}/history/{:d}/">история</a>'.format(
                self.admin_site.name, obj._meta.app_label, obj._meta.object_name.lower(), obj.id))

    history_link.short_description = 'История пользователя'

    def get_urls(self):
        urls = super(UserAdmin, self).get_urls()
        my_urls = [
            url(r'^history/(?P<pk>[0-9]+)/$', self.admin_site.admin_view(self.user_history_view)),
        ]
        return my_urls + urls

    def user_history_view(self, request, pk, extra_context=None):
        request.current_app = self.admin_site.name

        obj = self.get_object(request, pk)
        if obj is None:
            raise Http404

        opts = obj._meta

        client_list = obj.history_client.all()
        object_list = obj.history_object.all()

        action_list = sorted(
            chain(client_list, object_list),
            key=lambda obj: obj.history_date, reverse=True)

        history_list_display = getattr(self, "history_list_display", [])

        content_type = ContentType.objects.get_by_natural_key(
            *USER_NATURAL_KEY)
        admin_user_view = 'admin:%s_%s_change' % (content_type.app_label,
                                                  content_type.model)
        context = {
            'title': _('Change history: %s') % force_text(obj),
            'action_list': action_list,
            'module_name': capfirst(force_text(opts.verbose_name_plural)),
            'object': obj,
            'root_path': getattr(self.admin_site, 'root_path', None),
            'app_label': content_type.app_label,
            'opts': opts,
            'admin_user_view': admin_user_view,
            'history_list_display': history_list_display,
        }
        context.update(extra_context or {})

        return render(request, "admin/history_list.html", context)


admin.site.unregister(User)
admin.site.register(User, UserAdmin)

admin.site.register(Client, SimpleHistoryAdmin)
admin.site.register(Prioritet)
admin.site.register(Naznach)
admin.site.register(Okrug)
