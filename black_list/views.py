from django.shortcuts import render
from .models import BlackList
from .forms import BlackListForm
from django.views.generic.edit import CreateView, UpdateView
from django.views.generic import ListView, DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse

# Список из черного листа
class BlackListViews(LoginRequiredMixin, ListView):
    context_object_name = 'black_list'
    queryset = BlackList.objects.all()
    template_name = 'black_list/black_list.html'

# Добавлениев черный список
class BlackListCreate(LoginRequiredMixin, CreateView):
    model = BlackList
    form_class = BlackListForm
    template_name = 'black_list/add.html'

    def get_success_url(self):
        return reverse('black_list')

# Редактирование черного списка
class BlackListUpdate(LoginRequiredMixin, UpdateView):
    model = BlackList
    form_class = BlackListForm
    template_name = 'black_list/update.html'

    def get_success_url(self):
        return reverse('black_list')

# Удаление из черного списка
class BlackListDelete(LoginRequiredMixin, DeleteView):
    model = BlackList
    template_name = 'black_list/delete.html'

    def get_success_url(self):
        return reverse('black_list')
