from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
# Мои задачи


@login_required
def my_task(request):
    return render(request, 'mytask/my-task.html')

# Добавления задания


@login_required
def add_task(request):
    return render(request, 'mytask/add-task.html')