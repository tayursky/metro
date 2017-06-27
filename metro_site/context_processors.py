from .forms import *

def search_site(request):
    ''' Формы поиска на все страницах сайта '''
    object_form = SearchObjectFront()
    metro_form = SearchMetroFront()
    context = {'object_form_s': object_form, 'metro_form_s': metro_form}
    return context
