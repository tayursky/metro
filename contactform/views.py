from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required
from .forms import ContactForm, SZvonId, SZvonName
from .models import Contact
from django.views.generic.edit import CreateView, UpdateView
from django.views.generic import ListView, DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse
from django.views.decorators.csrf import csrf_exempt
from django.http.response import Http404

# Оставить заявку
def contact(request):
	if request.method == "POST":
		form = ContactForm(request.POST)
		if form.is_valid():
			form.save()
			return render(request, 'contactform/thank.html')
	else:
			form = ContactForm()
	return render(request, 'contactform/cont.html', {'form': form })

# Заявки
class ZayavkaList(LoginRequiredMixin, ListView):
    context_object_name = 'zayavka'
    queryset = Contact.objects.all().order_by('-data')
    template_name = 'contactform/zayavki.html'
    paginate_by = 10
    context = {}
    context['form_id'] = SZvonId(prefix='id')
    context['form_name'] = SZvonName(prefix='name')
    context['form_tel'] = SZvonId(prefix='tel')
    context['form_email'] = SZvonName(prefix='email')

    def get_context_data(self, **kwargs):
        context = super(ZayavkaList, self).get_context_data(**kwargs)
        context['form_id'] = SZvonId(prefix='id')
        context['form_name'] = SZvonName(prefix='name')
        context['form_tel'] = SZvonId(prefix='tel')
        context['form_email'] = SZvonName(prefix='email')
        context['form_data'] = SZvonId(prefix='data')
        return context
    # Поиск
    def post(self, request):
        form_i = SZvonId(self.request.POST, prefix='id')
        form_n = SZvonName(self.request.POST, prefix='name')
        form_t = SZvonId(self.request.POST, prefix='tel')
        form_e = SZvonId(self.request.POST, prefix='email')
        form_d = SZvonId(self.request.POST, prefix='data')
        if form_i.is_valid() and form_i.cleaned_data['search'] != '':
            search = form_i.cleaned_data['search']
            self.context['zayavka'] = Contact.objects.filter(id = search)
        if form_n.is_valid() and form_n.cleaned_data['search'] != '':
            search = form_n.cleaned_data['search']
            self.context['zayavka'] = Contact.objects.filter(name = search)
        if form_t.is_valid() and form_t.cleaned_data['search'] != '':
            search = form_t.cleaned_data['search']
            self.context['zayavka'] = Contact.objects.filter(tel = search)
        if form_e.is_valid() and form_e.cleaned_data['search'] != '':
            search = form_e.cleaned_data['search']
            self.context['zayavka'] = Contact.objects.filter(email = search)
        if form_d.is_valid() and form_d.cleaned_data['search'] != '':
            search = form_d.cleaned_data['search']
            self.context['zayavka'] = Contact.objects.filter(data = search)
        return render(request, self.template_name, self.context)

# Редактирование заявки
class ZayavkaUpdate(LoginRequiredMixin, UpdateView):
    model = Contact
    form_class = ContactForm
    template_name = 'contactform/zayavka_update.html'

    def get_success_url(self):
        return reverse('zayavka')

# Удаление
@csrf_exempt
@login_required
def del_ajax(request):
    if request.is_ajax():
        if request.method == "POST":
            if 'pk' in  request.POST:
                pk = request.POST.get('pk')
                pk = int(pk)
                post = Contact.objects.get(id=pk)
                post.delete()
                return HttpResponse("YES")
        else:
            return HttpResponse("NO")

# Редактировать через ajax
@csrf_exempt
@login_required
def update_zvon(request):
    if request.is_ajax():
        if request.method == "POST":
            if 'pk' in  request.POST:
                pk = request.POST.get('pk')
                pk = int(pk)
                post = Contact.objects.get(id=pk)
                form = ContactForm(instance=post)
                a = "%}"
                b = "{%"
                cc = '{} bootstrap_form {}  {}'.format(b, form, a)
                return HttpResponse(cc)
        else:
            return HttpResponse("NO")

@csrf_exempt
@login_required
def edit_zvon(request, pk):
    post = get_object_or_404(Contact, pk=pk)
    if request.method == "POST":
        form = ContactForm(data=request.POST, instance=post)
        if form.is_valid():
            post.save()
            return redirect('zayavka')
        else:
            return HttpResponse("NO2")

# Поиск заявки по номеру
def s_zvon_id(request):
    if request.method == "POST":
        form = SZvonId(request.POST)
        if form.is_valid():
            search = form.cleaned_data['search']
            zayavka = Contact.objects.filter(id = search)
    else:
        return redirect('zayavka')
    return render(request, 'contactform/zayavki.html', {'zayavka': zayavka})
