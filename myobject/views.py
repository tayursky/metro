from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .forms import MyObjectForm, SObjectTypeForm
from .models import MyObject
from django.views.generic.edit import CreateView, UpdateView
from django.views.generic import DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.core.urlresolvers import reverse
from django.utils import timezone
from black_list.models import BlackList
from myclient.forms import SerchNameForm
from django.db.models import Q

# Добавление объекта
@login_required
def add_object(request):
    if request.method == "POST":
        form = MyObjectForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            # Есть ли номер в черном списке
            tel = form.cleaned_data['block_tel']
            if BlackList.objects.filter(tel=tel).exists():
                error = "Номер находится в черном списке"
            else:
                post.my_manager = request.user
                post.save()
                return redirect('my_object')
    else:
        form = MyObjectForm()
        error = ""
    return render(request, 'myobject/add-object.html', {"form": form, 'error': error})

# Мои объекты
@login_required
def my_object(request):
    forms = {}
    forms['id'] = SerchNameForm(prefix="id")
    forms['adres'] = SerchNameForm(prefix="adres")
    forms['sobs'] = SerchNameForm(prefix="sobs")
    forms['type'] = SObjectTypeForm()
    if request.method == "POST":
        # Поиск по полям
        forms_id = SerchNameForm(request.POST, prefix="id")
        forms_adres = SerchNameForm(request.POST, prefix="adres")
        forms_sobs = SerchNameForm(request.POST, prefix="sobs")
        my_object = search_form(forms_id, forms_adres, forms_sobs)
        # Поиск по типу
        form_type = SObjectTypeForm(request.POST)
        if form_type.is_valid():
            search = form_type.cleaned_data['typeobj']
            my_object = MyObject.objects.filter(typeobj=search)
    else:
        my_object = MyObject.objects.filter(my_manager_id=request.user.id)

    return render(request, 'myobject/my-object.html', {"myobjects": my_object, "forms": forms})

# Обработка поиска по полям
def search_form(id_o, adres, sobs):
    if id_o.is_valid() and id_o.cleaned_data['search'] != '':
        search = id_o.cleaned_data['search']
        query = MyObject.objects.filter(id=search)

    elif adres.is_valid() and adres.cleaned_data['search'] != '':
        search = adres.cleaned_data['search']
        query = MyObject.objects.filter(adres=search)

    elif sobs.is_valid() and sobs.cleaned_data['search'] != '':
        search = sobs.cleaned_data['search']
        query = MyObject.objects.filter(Q(block_name=search) | Q(block_tel=search))
    else:
        query=0
    return query

# Скрыть клиента
@login_required
def hide_obj(request, pk):
    hide = MyObject.objects.get(id=pk)
    hide.hide_date = "1970-01-01"
    hide.hide = '1'
    hide.save()
    return redirect('my_object')

# Открытия клиента
@login_required
def show_obj(request, pk):
    try:
        hide = MyObject.objects.get(id=pk)
        hide.hide_date = "1970-01-01"
        hide.hide = '0'
        hide.save()
    except ObjectDoesNotExist:
        raise Http404
    return redirect('my_object')

# Удаление объекта
class ObjDelete(LoginRequiredMixin, DeleteView):
    model = MyObject
    template_name = 'myobject/delete-obj.html'
    # редирект на страницу мои объекты
    def get_success_url(self):
        return reverse('my_object')

# Редактирование объекта
class ObjUpdate(LoginRequiredMixin, UpdateView):
    model = MyObject
    form_class = MyObjectForm
    template_name = 'myobject/update-obj.html'

# Копирование объекта
class ObjCopy(LoginRequiredMixin, UpdateView):
    model = MyObject
    template_name = "myobject/copy-obj.html"
    form_class = MyObjectForm

    def form_valid(self, form):
        form.instance.my_manager = self.request.user
        # Для копирования устанавливаю pk и id в None
        form.instance.pk = None
        form.instance.id = None
        form.instance.zvon = timezone.now()
        return super(ObjCopy, self).form_valid(form)

# Прозвон объекта
@login_required
def zvon_obj(request, pk):
    zvon = MyObject.objects.get(id=pk)
    zvon.zvon = timezone.now()
    zvon.save()
    return redirect('my_object')
