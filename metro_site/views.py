from django.shortcuts import render, redirect
from myobject.models import MyObject
from .forms import SearchObjectFront, SearchMetroFront, SearchObjFullFront
from photo_baza.models import Photo
from django.db.models import Q

def home(request):
    ''' Гланая страница сайта '''
    myobj = MyObject.objects.all()[:4]
    for st in myobj:
        img = Photo.objects.filter(station = st.station_one)[:4]
    search_obj = SearchObjFullFront()
    context = {'myobj': myobj, 'search_obj': search_obj, 'imgs': img}
    return render(request, 'site/home.html', context)

def search_object(request):
    ''' Поиск объекта по номеру '''
    if request.method == "POST":
        form = SearchObjectFront(request.POST)
        if form.is_valid():
            search = form.cleaned_data['search']
            myobject = MyObject.objects.filter(id = search)
            if myobject.exists():
                for st in myobject:
                    img = Photo.objects.filter(station = st.station_one)[:3]
                    context = {'obj_single': myobject, 'imgs': img}
            else:
                context = {'obj_single': myobject}
    else:
        return redirect('/')
    print(st.station_one.photo)
    return render(request, 'site/obj-single.html', context)

def search_metro(request):
    ''' Поиск станции метро '''
    if request.method == "POST":
        form = SearchMetroFront(request.POST)
        if form.is_valid():
            search = form.cleaned_data['search']
            metro = MyObject.objects.filter(Q(station_one__name = search) | Q(station_two__name = search))
            if metro.exists():
                for st in metro:
                    img = Photo.objects.filter(station = st.station_one)
                    context = {'search_object': metro, 'imgs': img}
            else:
                context = {'search_object': metro}
    else:
        return redirect('/')
    print(context)
    return render(request, 'site/search.html', {'search_object': metro})
