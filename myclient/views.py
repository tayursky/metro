from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.core.exceptions import ObjectDoesNotExist
from django.http.response import Http404
from django.views.generic.edit import CreateView, UpdateView
from django.views.generic import DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse
from .forms import ClientForm, HideClientForm, SerchNameForm,\
                SCkientMenForm, SCkientHideForm, SCkientNazForm
from .models import Client
from black_list.models import BlackList
from django.core.mail import send_mail, BadHeaderError
from myobject.models import MyObject
from django.views.decorators.csrf import csrf_exempt
from django.db.models import Q


@login_required
def add_client(request):
    '''Добавления клиента'''

    if request.method == "POST":
        form = ClientForm(request.POST)
        if form.is_valid():
            post = form.save(commit=False)
            '''Есть ли клиент в черном списке'''
            tel = form.cleaned_data['tel']
            if BlackList.objects.filter(tel=tel).exists():
                error = "Номер находится в черном списке"
            else:
                podborka = form.cleaned_data['podborka']
                '''Проверка отправлять объекты клиенту или нет'''
                if podbork:
                    metro = form.cleaned_data['metro']
                    adres = form.cleaned_data['adres']
                    komisiya = form.cleaned_data['komisiya']
                    etaj = form.cleaned_data['etaj']
                    if komisiya and etaj:
                        objects = MyObject.objects\
                            .filter(block_procent=0, etaj=1)
                    elif komisiya and not etaj:
                        objects = MyObject.objects.filter(block_procent=0)
                    elif komisiya and etaj:
                        objects = MyObject.objects.filter(etaj=1)
                    '''Отправка письма клиенту'''
                    email = form.cleaned_data['email']
                    recipients = []
                    recipients.append(email)
                    sabject = "Объекты"
                    message = "Сдесь должны быть объекты"
                    sent = 'socanime@gmail.com'

                    try:
                        send_mail(subject, message, send, recipients)
                    except BadHeaderError:  # Защита от уязвимости
                        return HttpResponse('Invalid header found')

                post.my_manager = request.user
                post.save()
                return redirect('/login/client/my/{}'.format(request.user.id))
    else:
        form = ClientForm()
        error = ""
    return render(request, 'myclient/add-client.html',
                  {'form': form, 'error': error})


@login_required
def my_client(request, pk):
    '''Мои клиенты'''

    '''Формы поиска'''
    forms = {}
    forms['name'] = SerchNameForm(prefix='name')
    forms['tel'] = SerchNameForm(prefix='tel')
    forms['email'] = SerchNameForm(prefix='email')
    forms['manager'] = SCkientMenForm()
    forms['hide'] = SCkientHideForm()
    forms['naz'] = SCkientNazForm()
    form = HideClientForm()

    if request.method == 'POST':
        form_n = SerchNameForm(request.POST, prefix='name')
        form_t = SerchNameForm(request.POST, prefix='tel')
        form_e = SerchNameForm(request.POST, prefix='email')
        # Вызов функции поиска
        myclient = search_form(form_n, form_t, form_e)
        # Поиск по полю Скрыт\Не скры
        form_hide = SCkientHideForm(request.POST)
        if form_hide.is_valid():
            search = form_hide.cleaned_data['hide']
            if search == "yes":
                myclient = Client.objects.filter(my_manager_id=pk,
                                                 hide_date__gte='1970-01-01')
            else:
                myclient = Client.objects\
                    .filter(my_manager_id=pk)\
                    .exclude(hide_date__gte='1970-01-01')
        # Поиск по полю назначения
        form_naz = SCkientNazForm(request.POST)
        if form_naz.is_valid():
            search = form_naz.cleaned_data['naznach_one']
            myclient = Client.objects.filter(Q(naznach_one=search) |
                                             Q(naznach_two=search))
    else:
        myclient = Client.objects.filter(my_manager_id=pk)
    return render(request, 'myclient/my-client.html',
                  {"clients": myclient, 'form': form, 'forms': forms})


def search_form(name, tel, email):
    '''Обработка поиска по полям'''
    if name.is_valid() and name.cleaned_data['search'] != '':
        search = name.cleaned_data['search']
        query = Client.objects.filter(name=search)

    elif tel.is_valid() and tel.cleaned_data['search'] != '':
        search = tel.cleaned_data['search']
        query = Client.objects.filter(tel=search)

    elif email.is_valid() and email.cleaned_data['search'] != '':
        search = email.cleaned_data['search']
        query = Client.objects.filter(email=search)
    else:
        query = 0
    return query


@login_required
def hide_client(request, pk):
    '''Скрыть клиента'''
    if request.method == "POST":
        form = HideClientForm(request.POST)
        if form.is_valid():
            date = form.cleaned_data['hide_date']
            try:
                hide = Client.objects.get(id=pk)
                hide.hide_date = date
                hide.hide = '1'
                hide.save()
                return redirect('/login/client/my/{}'.format(request.user.id))
                # return reverse('my_client',
                #             kwargs={'pk': self.request.user.id})
            except ObjectDoesNotExist:
                raise Http404
        else:
            raise Http404


@login_required
def show_client(request, pk):
    '''Открытия клиента'''
    try:
        hide = Client.objects.get(id=pk)
        hide.hide_date = "1970-01-01"
        hide.hide = '0'
        hide.save()
    except ObjectDoesNotExist:
        raise Http404
    return redirect('/login/client/my/{}'.format(request.user.id))


class ClientUpdate(LoginRequiredMixin, UpdateView):
    '''Редактирование клиента'''
    model = Client
    # fields = ['name', 'tel']
    form_class = ClientForm
    template_name_suffix = '_update_form'

    def get_success_url(self):
        return reverse('my_client', kwargs={'pk': self.request.user.id})


class ClientDelete(LoginRequiredMixin, DeleteView):
    '''Удаление клиента'''
    model = Client
    template_name = 'myclient/client_delete.html'

    '''редирект на страницу мои клиенты'''
    def get_success_url(self):
        return reverse('my_client', kwargs={'pk': self.request.user.id})


class ClientCopy(LoginRequiredMixin, UpdateView):
    '''Копирование клиента'''
    model = Client
    template_name = "myclient/copy_client.html"
    form_class = ClientForm

    def form_valid(self, form):
        form.instance.manager = self.request.user
        '''Для копирования устанавливаю pk и id в None'''
        form.instance.pk = None
        form.instance.id = None
        return super(ClientCopy, self).form_valid(form)
