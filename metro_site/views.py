from django.shortcuts import render, redirect, get_object_or_404
from django.db.models import Q

from myobject.models import MyObject
from photo_baza.models import Photo
from .forms import SearchObjectFront, SearchMetroFront, SearchObjFullFront


def home(request):
    ''' Гланая страница сайта '''
    myobj = MyObject.objects.all()[:4]
    form = SearchObjFullFront()
    if request.method == "POST":
        form = SearchObjFullFront(request.POST)
        if form.is_valid():
            form_price = int(form.cleaned_data['price'])
            myobj = MyObject.objects.filter(
                naznach=form.cleaned_data['naznach'],
                price__lte=(form.fields['price'].choices)[form_price][1],
                okrug=form.cleaned_data['okrug'],
                area_range=form.cleaned_data['area_range']
            )

            if not myobj:
                context = {'myobj': myobj, 'form': form}
                return render(request, 'site/home.html', context)

    for st in myobj:
        img = Photo.objects.filter(station=st.station_one)[:4]

    context = {'myobj': myobj, 'form': form}#, 'imgs': img}
    return render(request, 'site/home.html', context)


def search_object(request):
    ''' Поиск объекта по номеру '''
    if request.method == "POST":
        form = SearchObjectFront(request.POST)
        if form.is_valid():
            search = form.cleaned_data['search']
            myobject = get_object_or_404(MyObject, id=search)
            try:
                img = Photo.objects.filter(station=myobject.station_one)[:4]
                img_obj = MyObject.objects.\
                    filter(okrug=myobject.okrug.all()[:1])
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
            metro = MyObject.objects.\
                filter(Q(station_one__name=search) |
                       Q(station_two__name=search))
            if metro.exists():
                for st in metro:
                    img = Photo.objects.filter(station=st.station_one)
                    context = {'search_object': metro, 'imgs': img}
            else:
                context = {'search_object': metro}
    else:
        return redirect('/')
    return render(request, 'site/search.html', {'search_object': metro})


def obj_single(request, pk):
    '''Переход по ссылки на объект,
    сделать более организовано, без копипаста
    '''
    myobject = get_object_or_404(MyObject, pk=pk)
    try:
        img = Photo.objects.filter(station=myobject.station_one)[:4]
        img_obj = MyObject.objects.\
            filter(okrug=myobject.okrug.all()[:1])
        context = {'obj': myobject, 'imgs': img, 'img_objs': img_obj}
    except:
        context = {'obj': myobject}

    return render(request, 'site/obj-single.html', context)
