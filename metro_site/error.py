from django.shortcuts import render_to_response
from django.template import RequestContext


def e_handler404(request):
    context = RequestContext(request)
    response = render_to_response('404.html', context)
    response.status_code = 404
    return response


# def e_handler500(request):
#     context = RequestContext(request)
#     response = render_to_response('error500.html', context)
#     response.status_code = 500
#     return response
