from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .forms import ClientForm

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