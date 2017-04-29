from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .forms import ClientForm
# Мои задачи


@login_required
def my_task(request):
    return render(request, 'myclient/my-task.html')

# Добавления задания


@login_required
def add_task(request):
    return render(request, 'myclient/add-task.html')

# Добавления клиента


@login_required
def add_client(request):
    if request.method == "POST":
        form = ClientForm(request.POST)
        if form.is_valid():
            # Сахроняю форму
            post = form.save(commit=False)
            post.manager = request.user
            post.save()
            return redirect('my_client')
    else:
        form = ClientForm()
    return render(request, 'myclient/add-client.html', {'form': form})

# Мои клиенты


@login_required
def my_client(request):
    return render(request, 'myclient/my-client.html')

# Добавление объекта


@login_required
def add_object(request):
    return render(request, 'myclient/add-object.html')

# Мои объекты


@login_required
def my_object(request):
    return render(request, 'myclient/my-object.html')
