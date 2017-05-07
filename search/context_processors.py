#from django.template import Context, Template, RequestContext
from .forms import SearchClient


# Формы поиска в шапке админки
def search_admin(request):
    client_form = SearchClient()
    return {'client_form': client_form}
