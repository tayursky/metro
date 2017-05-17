from .forms import *


# Формы поиска на сайте
def search_site(request):
    object_form = SearchObjectFront()
    metro_form = SearchMetroFront()
    context = {'object_form_s': object_form, 'metro_form_s': metro_form}
    return context
