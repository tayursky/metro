from django.shortcuts import render
from .models import BlackList
from .forms import BlackListForm
from django.views.generic.edit import CreateView, UpdateView
from django.views.generic import ListView, DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse


class BlackListViews(LoginRequiredMixin, ListView):
    ''' Список из черного листа '''
    context_object_name = 'black_list'
    queryset = BlackList.objects.all()
    template_name = 'black_list/black_list.html'


class BlackListCreate(LoginRequiredMixin, CreateView):
    ''' Добавлениев черный список '''
    model = BlackList
    form_class = BlackListForm
    template_name = 'black_list/add.html'

    def get_success_url(self):
        return reverse('black_list')


class BlackListUpdate(LoginRequiredMixin, UpdateView):
    ''' Редактирование черного списка '''
    model = BlackList
    form_class = BlackListForm
    template_name = 'black_list/update.html'

    def get_success_url(self):
        return reverse('black_list')


@csrf_exempt
@login_required
def del_black_list(request):
    ''' Удаление из черного списка '''
    if request.is_ajax():
        if request.method == "POST":
            if 'pk' in request.POST:
                pk = request.POST.get('pk')
                pk = int(pk)
                post = BlackList.objects.get(id=pk)
                post.delete()
                return HttpResponse("YES")
    else:
        return HttpResponse("NO")
