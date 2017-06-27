from django.shortcuts import render, redirect, get_object_or_404
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
            myobject = get_object_or_404(MyObject, id=search)
            try:
                img = Photo.objects.filter(station = myobject.station_one)[:4]
                img_obj = MyObject.objects.filter \
                    (okrug = myobject.okrug.all()[:1])
                context = {'obj': myobject, 'imgs': img, 'img_objs': img_obj}
            except:
                context = {'obj': myobject}
    else:
        return redirect('/')

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
    return render(request, 'site/search.html', {'search_object': metro})

#Переход по ссылки на объект, сделать более организовано, без копипаста
def obj_single(request, pk):
    myobject = get_object_or_404(MyObject, pk=pk)
    try:
        img = Photo.objects.filter(station = myobject.station_one)[:4]
        img_obj = MyObject.objects.filter \
            (okrug = myobject.okrug.all()[:1])
        context = {'obj': myobject, 'imgs': img, 'img_objs': img_obj}
    except:
        context = {'obj': myobject}

    return render(request, 'site/obj-single.html', context)
