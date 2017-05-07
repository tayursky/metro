from django.shortcuts import render
from .forms import SearchClient
from myclient.models import Client

# Поиск клиента
def search_client(request):
    if request.method == "POST":
        form = SearchClient(request.POST)
        if form.is_valid():
            search = form.cleaned_data['search']
            # Сделать поиск по 3 столбцам как в ТЗ и проверку чей клиент
            client = Client.objects.filter(name = search)
    else:
        return redirect('my_client')
    return render(request, 'search/search-client.html', {'client': client})
