#from django.template import Context, Template, RequestContext
from .forms import *

def search_admin(request):
    '''Формы поиска в шапке админки'''
    object_form = SearchObject()
    adres_form = SearchAdres()
    client_form = SearchClient()
    metro_form = SearchMetro()
    vlad_form = SearchVlad()
    context = {'object_form': object_form, 'adres_form': adres_form, 'client_form': client_form, 'metro_form': metro_form, 'vlad_form': vlad_form}
    return context
