from django.shortcuts import render, redirect
from django.db.models import Q
from .forms import *
from myclient.models import Client
from myobject.models import MyObject


def search_object(request):
    '''Поиск объекта по номеру'''
    if request.method == "POST":
        form = SearchObject(request.POST)
        if form.is_valid():
            search = form.cleaned_data['search']
            myobject = MyObject.objects.filter(id=search)
    else:
        return redirect('/login/object/')
    return render(request, 'myobject/my-object.html',
                  {'search_object': myobject})


def search_adres(request):
    '''Поиск объекта по адресу'''
    if request.method == "POST":
        form = SearchAdres(request.POST)
        if form.is_valid():
            search = form.cleaned_data['search']
            # Поиск по полю адрес без учета регистра
            myobject = MyObject.objects.filter(adres__icontains=search)
    else:
        return redirect('/login/object/')
    return render(request, 'myobject/my-object.html',
                  {'search_object': myobject})


def search_client(request):
    '''Поиск клиента'''
    if request.method == "POST":
        form = SearchClient(request.POST)
        if form.is_valid():
            search = form.cleaned_data['search']
            # Поиск по любому из трех полей
            client = Client.objects.filter(
                Q(name__exact=search) |
                Q(email__exact=search) |
                Q(tel__exact=search))
    else:
        return redirect('/login/client/')
    return render(request, 'myclient/my-client.html',
                  {'search_client': client})


def search_metro(request):
    '''Поиск станции метро'''
    if request.method == "POST":
        form = SearchMetro(request.POST)
        if form.is_valid():
            search = form.cleaned_data['search']
            metro = MyObject.objects.filter(
                Q(station_one__name=search) | Q(station_two__name=search))
    else:
        return redirect('/login/object/')
    return render(request, 'myobject/my-object.html', {'search_object': metro})


def search_vlad(request):
    '''Поиск по владельцу'''
    if request.method == "POST":
        form = SearchVlad(request.POST)
        if form.is_valid():
            search = form.cleaned_data['search']
            vlad = MyObject.objects.filter(
                Q(block_name__exact=search) | Q(block_tel__exact=search))
    else:
        return redirect('/login/object/')
    return render(request, 'myobject/my-object.html',
                  {'search_object': vlad})
