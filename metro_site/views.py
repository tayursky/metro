from django.shortcuts import render, redirect, get_object_or_404
from django.db.models import Q

from myobject.models import MyObject, MultiImages
from photo_baza.models import Photo
from .forms import SearchObjectFront, SearchMetroFront, SearchObjFullFront


def home(request):
    ''' Гланая страница сайта '''
    myobj = MyObject.objects.all()[:3]
    form = SearchObjFullFront()
    if request.method == "POST":
        form = SearchObjFullFront(request.POST)
        if form.is_valid():
            form_price = int(form.cleaned_data['price'])
            okrug = form.cleaned_data['okrug']
            myobjs = []
            for o in okrug:
                myobjs.append(MyObject.objects.filter(
                    naznach=form.cleaned_data['naznach'],
                    price__lte=(form.fields['price'].choices)[form_price][1],
                    okrug=o,
                    area_range=form.cleaned_data['area_range']
                ))
                print(myobjs)
            if myobjs:
                for sts in myobjs:
                    for st in sts:
                        img = Photo.objects.filter(station=st.station_one)[:1]
                        if img:
                            context = {'myobjs': myobjs, \
                                       'form': form, 'imgs': img}
                        else:
                            context = {'myobjs': myobjs, 'form': form}
                        return render(request, 'site/home.html', context)
            context = {'form': form}
            return render(request, 'site/home.html', context)
    if myobj:
        for st in myobj:
            img = Photo.objects.filter(station=st.station_one)[:1]
            if img:
                context = {'myobj': myobj, 'form': form, 'imgs': img}
                return render(request, 'site/home.html', context)
        context = {'myobj': myobj, 'form': form}
    return render(request, 'site/home.html', context)


def search_object(request):
    ''' Поиск объекта по номеру '''
    if request.method == "POST":
        form = SearchObjectFront(request.POST)
        if form.is_valid():
            search = form.cleaned_data['search']
            myobject = get_object_or_404(MyObject, id=search)
            photos = MultiImages.objects.filter(parent=myobject)
            print(photos)
            try:
                img = Photo.objects.filter(station=myobject.station_one)[:1]
                img_obj = MyObject.objects.\
                    filter(okrug=myobject.okrug.all()[:1])
                context = {'obj': myobject, 'photos': photos, 'imgs': img,  'img_objs': img_obj}
            except:
                context = {'obj': myobject, 'photos': photos}
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
                    img = Photo.objects.filter(station=st.station_one)[:1]
                    context = {'search_object': metro, 'imgs': img}
            else:
                context = {'search_object': metro}
    else:
        return redirect('/')
    return render(request, 'site/search.html', context)


def obj_single(request, pk):
    '''Переход по ссылки на объект,
    сделать более организовано, без копипаста
    '''
    myobject = get_object_or_404(MyObject, pk=pk)
    photos = MultiImages.objects.filter(parent=myobject)
    try:
        img = Photo.objects.filter(station=myobject.station_one)[:1]
        img_obj = MyObject.objects.\
            filter(okrug=myobject.okrug.all()[:1])
        context = {'obj': myobject, 'photos': photos, 'imgs': img, 'img_objs': img_obj}
    except:
        context = {'obj': myobject, 'photos': photos}

    return render(request, 'site/obj-single.html', context)

def new_obj(request):
    '''Новые объекты'''
    myobj = MyObject.objects.order_by('-id')[:16]
    for st in myobj:
        img = Photo.objects.filter(station=st.station_one)[:1]
        context = {'search_object': myobj, 'imgs': img}

    return render(request, 'site/search.html', context)

def under(request):
    '''Объекты подземки'''
    myobj = MyObject.objects.filter(typeobj=4)
    if myobj:
        for st in myobj:
            img = Photo.objects.filter(station=st.station_one)[:1]
            context = {'search_object': myobj, 'imgs': img}
    return render(request, 'site/search.html', context)
