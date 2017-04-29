from django.shortcuts import render
from django.contrib.auth.decorators import login_required

# Мои задачи


@login_required
def my_task(request):
    return render(request, 'myclient/my-task.html')

# Добавления задания


@login_required
def add_task(request):
    return render(request, 'myclient/add-task.html')

# Добавления клиента


@login_required
def add_client(request):
    return render(request, 'myclient/add-client.html')

# Мои клиенты


@login_required
def my_client(request):
    return render(request, 'myclient/my-client.html')

# Добавление объекта


@login_required
def add_object(request):
    return render(request, 'myclient/add-object.html')

# Мои объекты


@login_required
def my_object(request):
    return render(request, 'myclient/my-object.html')
