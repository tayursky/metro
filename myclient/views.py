from django.shortcuts import render
from django.contrib.auth.decorators import login_required

# Мои задачи


@login_required
def my_task(request):
    return render(request, 'myclient/my-task.html')


@login_required
def my_client(request):
    return render(request, 'myclient/my-client.html')


@login_required
def my_object(request):
    return render(request, 'myclient/my-object.html')
