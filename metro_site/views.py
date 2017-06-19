from django.shortcuts import render, redirect
from myobject.models import MyObject
from .forms import SearchObjectFront, SearchMetroFront


# Главная
def home(request):
    myobj = MyObject.objects.all()[:4]
    return render(request, 'site/home.html', locals())

# Поиск объекта по номеру
def search_object(request):
    if request.method == "POST":
        form = SearchObjectFront(request.POST)
        if form.is_valid():
            search = form.cleaned_data['search']
            myobject = MyObject.objects.filter(id = search)
    else:
        return redirect('/')
    return render(request, 'myobject/my-object.html', {'search_object': myobject})

# Поиск станции метро
def search_metro(request):
    if request.method == "POST":
        form = SearchMetroFront(request.POST)
        if form.is_valid():
            search = form.cleaned_data['search']
            # Узнать как сделать или и искать по двум станциям
            metro = MyObject.objects.filter(Q(station_one__name = search) | Q(station_two__name = search))
    else:
        return redirect('/')
    return render(request, 'myobject/my-object.html', {'search_object': metro})
