

<a href = "/add/like/{{post.id}}/" > like < /a >

url(r'^lenta/like/(?P<pk>\d+)/$', views.addlike)

from django.core.exceptions import ObjectDoesNotExist
from django.http.response import Http404


def addlike(request, pk):
    try:
        like = Like.objects.get(id=pk)
        like.likes += 1
        like.save()
    except ObjectDoesNotExist:
        raise Http404
    return redirect('/')
