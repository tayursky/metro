from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.core.exceptions import ObjectDoesNotExist
from django.http.response import Http404
from django.views.generic.edit import CreateView, UpdateView
from django.views.generic import DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse
from .forms import ClientForm, HideClientForm, TaskClientForm
from .models import Client, TaskClient


# Добавления клиента
@login_required
def add_client(request):
    if request.method == "POST":
        form = ClientForm(request.POST)
        if form.is_valid():
            # Сахроняю форму
            post = form.save(commit=False)
            post.my_manager = request.user
            post.save()
            return redirect('my_client')
    else:
        form = ClientForm()
    return render(request, 'myclient/add-client.html', {'form': form})

# Мои клиенты
@login_required
def my_client(request):
    myclient = Client.objects.filter(my_manager_id=request.user.id)
    form = HideClientForm()
    return render(request, 'myclient/my-client.html', {"clients": myclient, 'form': form})

# Скрыть клиента
@login_required
def hide_client(request, pk):
    if request.method == "POST":
        form = HideClientForm(request.POST)
        if form.is_valid():
            date = form.cleaned_data['hide_date']
            try:
                hide = Client.objects.get(id=pk)
                hide.hide_date = date
                hide.hide = '1'
                hide.save()
            except ObjectDoesNotExist:
                raise Http404
            return redirect('my_client')
        else:
            raise Http404

# Открытия клиента
@login_required
def show_client(request, pk):
    try:
        hide = Client.objects.get(id=pk)
        hide.hide_date = "1970-01-01"
        hide.hide = '0'
        hide.save()
    except ObjectDoesNotExist:
        raise Http404
    return redirect('my_client')

# Редактирование клиента
class ClientUpdate(LoginRequiredMixin, UpdateView):
    model = Client
    #fields = ['name', 'tel']
    form_class = ClientForm
    template_name_suffix = '_update_form'

    # def get_object(self):
    # return Client.objects.get(id=self.object.pk)

# Удаление клиента
class ClientDelete(LoginRequiredMixin, DeleteView):
    model = Client
    template_name = 'myclient/client_delete.html'
    # редирект на страницу мои клиенты

    def get_success_url(self):
        return reverse('my_client')


# Добавление задачи для клиента
class AddTaskClient(LoginRequiredMixin, CreateView):
    model = TaskClient
    #fields = ['name']
    template_name = "myclient/add_task_client.html"
    form_class = TaskClientForm

    def form_valid(self, form):
        form.instance.manager = self.request.user
        return super(AddTaskClient, self).form_valid(form)

# Копирование клиента
class ClientCopy(LoginRequiredMixin, UpdateView):
    model = Client
    template_name = "myclient/copy_client.html"
    form_class = ClientForm

    def form_valid(self, form):
        form.instance.manager = self.request.user
        # Для копирования устанавливаю pk и id в None
        form.instance.pk = None
        form.instance.id = None
        return super(ClientCopy, self).form_valid(form)
