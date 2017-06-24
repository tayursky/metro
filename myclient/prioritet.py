from django.http import HttpResponse
from django.views.generic.edit import CreateView, UpdateView
from django.views.generic import ListView, DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin
from .forms import PrioritetForm
from .models import Prioritet
from django.urls import reverse
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt


class PrioritetList(LoginRequiredMixin, ListView):
    '''Список приоритетов'''
    context_object_name = 'prioritet'
    queryset = Prioritet.objects.all()
    template_name = 'myclient/prioritet/prioritet.html'

class AddPrioritet(LoginRequiredMixin, CreateView):
    '''Добавление приоритета'''
    model = Prioritet
    template_name = "myclient/prioritet/add_prioritet.html"
    form_class = PrioritetForm

class PrioritetUpdate(LoginRequiredMixin, UpdateView):
    '''Редактирование приоритета'''
    model = Prioritet
    form_class = PrioritetForm
    template_name = 'myclient/prioritet/update.html'

class PrioritetDelete(LoginRequiredMixin, DeleteView):
    '''Удаление приоритета'''
    model = Prioritet
    template_name = 'myclient/prioritet/delete.html'

    def get_success_url(self):
        return reverse('prioritet')

@csrf_exempt
@login_required
def del_prio(request):
    '''Удаление приоритета'''
    if request.is_ajax():
        if request.method == "POST":
            if 'pk' in  request.POST:
                pk = request.POST.get('pk')
                pk = int(pk)
                post = Prioritet.objects.get(id=pk)
                post.delete()
                return HttpResponse("YES")
    else:
        return HttpResponse("NO")
