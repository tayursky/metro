from django.shortcuts import render, redirect
from .forms import *
from myclient.models import Client
from myobject.models import MyObject

# Поиск объекта по номеру
def search_object(request):
    if request.method == "POST":
        form = SearchObject(request.POST)
        if form.is_valid():
            search = form.cleaned_data['search']
            myobject = MyObject.objects.filter(id = search)
    else:
        return redirect('/login/object/')
    return render(request, 'myobject/my-object.html', {'search_object': myobject})

# Поиск объекта по адресу
def search_adres(request):
    if request.method == "POST":
        form = SearchAdres(request.POST)
        if form.is_valid():
            search = form.cleaned_data['search']
            myobject = MyObject.objects.filter(adres = search)
    else:
        return redirect('/login/object/')
    return render(request, 'myobject/my-object.html', {'search_object': myobject})

# Поиск клиента
def search_client(request):
    if request.method == "POST":
        form = SearchClient(request.POST)
        if form.is_valid():
            search = form.cleaned_data['search']
            # Сделать поиск по 3 столбцам как в ТЗ
            client = Client.objects.filter(name = search)
    else:
        return redirect('/login/client/')
    return render(request, 'myclient/my-client.html', {'search_client': client})

# Поиск станции метро
def search_metro(request):
    if request.method == "POST":
        form = SearchMetro(request.POST)
        if form.is_valid():
            search = form.cleaned_data['search']
            # Узнать как сделать или и искать по двум станциям
            metro = MyObject.objects.filter(station_one = search)
    else:
        return redirect('/login/object/')
    return render(request, 'myobject/my-object.html', {'search_metro': metro})

# Поиск по владельцу
def search_vlad(request):
    if request.method == "POST":
        form = SearchVlad(request.POST)
        if form.is_valid():
            search = form.cleaned_data['search']
            # Узнать как сделать или
            vlad = MyObject.objects.filter(block_name = search)
    else:
        return redirect('/login/object/')
    return render(request, 'myobject/my-object.html', {'search_vlad': vlad})
