from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.core.exceptions import ObjectDoesNotExist
from django.http.response import Http404
from django.views.generic.edit import CreateView, UpdateView
from django.views.generic import ListView, DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse
from .forms import TaskClientForm
from .models import Client, TaskClient


'''# Мои задачи
@login_required
def my_task(request):
    mytask = TaskClient.objects.filter(manager_id=request.user.id, end=False)
    return render(request, 'myclient/my-task.html', {"mytask": mytask})'''


class MyTaskList(LoginRequiredMixin, ListView):
    '''Страница Мои задачи'''
    context_object_name = 'mytask'
    queryset = TaskClient.objects.filter(end=False)
    template_name = 'myclient/my-task.html'

    def get_context_data(self, **kwargs):
        context = super(MyTaskList, self).get_context_data(**kwargs)
        context['mytask'] = TaskClient.objects.filter(
            manager_id=self.request.user.id, end=False)\
            .order_by('-prioritet__num')
        return context


class AddTaskClient(LoginRequiredMixin, CreateView):

    '''Добавление задачи для клиента'''

    model = TaskClient
    # fields = ['name']
    template_name = "myclient/add_task_client.html"
    form_class = TaskClientForm

    def form_valid(self, form):
        form.instance.manager = self.request.user
        return super(AddTaskClient, self).form_valid(form)

    def get_success_url(self):
        return reverse('my_client', kwargs={'pk': self.request.user.id})


class TaskUpdate(LoginRequiredMixin, UpdateView):
    '''Редактирование задачи'''
    model = TaskClient
    # fields = ['name', 'tel']
    form_class = TaskClientForm
    template_name = 'myclient/add_task_client.html'

    def get_success_url(self):
        return reverse('my_task')  # kwargs={'pk': self.request.user.id})
