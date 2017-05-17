from django.shortcuts import render, redirect
from myobject.models import MyObject

# Главная
def home(request):
    return render(request, 'site/home.html')
