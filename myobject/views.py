from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .forms import MyObjectForm
from .models import MyObject
from django.views.generic.edit import CreateView, UpdateView
from django.views.generic import DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin

# Добавление объекта
@login_required
def add_object(request):
    if request.method == "POST":
        form = MyObjectForm(request.POST)
        if form.is_valid():
            # Сахроняю форму
            post = form.save(commit=False)
            post.my_manager = request.user
            post.save()
            return redirect('my_object')
    else:
        form = MyObjectForm()
    return render(request, 'myobject/add-object.html', {"form": form})

# Мои объекты
@login_required
def my_object(request):
    my_object = MyObject.objects.filter(my_manager_id=request.user.id)
    return render(request, 'myobject/my-object.html', {"myobjects": my_object})

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
    # редирект на страницу мои клиенты

    def get_success_url(self):
        return reverse('my_object')
