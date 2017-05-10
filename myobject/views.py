from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .forms import MyObjectForm
from .models import MyObject

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
