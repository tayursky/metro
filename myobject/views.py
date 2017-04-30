from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
# Добавление объекта


@login_required
def add_object(request):
    return render(request, 'myobject/add-object.html')

# Мои объекты


@login_required
def my_object(request):
    return render(request, 'myobject/my-object.html')

