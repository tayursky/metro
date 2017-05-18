from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from .forms import ContactForm
from .models import Contact
from django.views.generic.edit import CreateView, UpdateView
from django.views.generic import ListView, DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse

# Форма обратной связи
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

# Редактирование заявки
class ZayavkaUpdate(LoginRequiredMixin, UpdateView):
    model = Contact
    form_class = ContactForm
    template_name = 'contactform/zayavka_update.html'

    def get_success_url(self):
        return reverse('update_zayavka')

# Удаление заявки
class ZayavkaDelete(LoginRequiredMixin, DeleteView):
    model = Contact
    template_name = 'contactform/zayavka_delete.html'
    def get_success_url(self):
        return reverse('zayavka')
