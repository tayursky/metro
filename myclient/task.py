from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.core.exceptions import ObjectDoesNotExist
from django.http.response import Http404
from django.views.generic.edit import CreateView, UpdateView
from django.views.generic import DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse
from .forms import TaskClientForm
from .models import Client, TaskClient


# Мои задачи
@login_required
def my_task(request):
    mytask = TaskClient.objects.filter(manager_id=request.user.id, end=False)
    return render(request, 'myclient/my-task.html', {"mytask": mytask})

class AddTaskClient(LoginRequiredMixin, CreateView):

    '''Добавление задачи для клиента'''

    model = TaskClient
    #fields = ['name']
    template_name = "myclient/add_task_client.html"
    form_class = TaskClientForm

    def form_valid(self, form):
        form.instance.manager = self.request.user
        return super(AddTaskClient, self).form_valid(form)
