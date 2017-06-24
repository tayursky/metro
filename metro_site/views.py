from django.shortcuts import render, redirect
from myobject.models import MyObject
from .forms import SearchObjectFront, SearchMetroFront, SearchObjFullFront


def home(request):
    ''' Гланая страница сайта '''
    myobj = MyObject.objects.all()[:4]
    search_obj = SearchObjFullFront()
    context = {'myobj': myobj, 'search_obj': search_obj}
    return render(request, 'site/home.html', context)

def search_object(request):
    ''' Поиск объекта по номеру '''
    if request.method == "POST":
        form = SearchObjectFront(request.POST)
        if form.is_valid():
            search = form.cleaned_data['search']
            myobject = MyObject.objects.filter(id = search)
    else:
        return redirect('/')
    return render(request, 'site/obj-single.html', {'obj_single': myobject})

def search_metro(request):
    ''' Поиск станции метро '''
    if request.method == "POST":
        form = SearchMetroFront(request.POST)
        if form.is_valid():
            search = form.cleaned_data['search']
            # Узнать как сделать или и искать по двум станциям
            metro = MyObject.objects.filter(Q(station_one__name = search) | Q(station_two__name = search))
    else:
        return redirect('/')
    return render(request, 'myobject/my-object.html', {'search_object': metro})
