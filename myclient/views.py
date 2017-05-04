from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.views.generic.edit import UpdateView
from django.contrib.auth.mixins import LoginRequiredMixin
from .forms import ClientForm
from .models import Client
# Добавления клиента


@login_required
def add_client(request):
    if request.method == "POST":
        form = ClientForm(request.POST)
        if form.is_valid():
            # Сахроняю форму
            post = form.save(commit=False)
            post.my_manager = request.user
            post.save()
            return redirect('my_client')
    else:
        form = ClientForm()
    return render(request, 'myclient/add-client.html', {'form': form})

# Мои клиенты


@login_required
def my_client(request):
    myclient = Client.objects.filter(my_manager_id=request.user.id)
    return render(request, 'myclient/my-client.html', {"clients": myclient})


class ClientUpdate(LoginRequiredMixin, UpdateView):
    model = Client
    '''fields = ['name', 'tel', 'email', 'naznach_one', 'naznach_two',
              'area_ot', 'area_do', 'price_obsh', 'price_m', 'dop_kont', 'metro', 'adres', 'komisiya', 'etaj', 'podborka', 'okrug', 'type_obj'
              ]'''
    form_class = ClientForm
    template_name_suffix = '_update_form'

    # def get_object(self):
    # return Client.objects.get(id=self.object.pk)
