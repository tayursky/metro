from django.shortcuts import render
from django.contrib.auth.decorators import login_required

# Мои задачи


@login_required
def my_task(request):
    return render(request, 'myclient/my-task.html')
