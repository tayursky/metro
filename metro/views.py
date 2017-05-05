from django.http.response import HttpResponse


def home(request):
    return HttpResponse("Извините сайт в разработке.")
