from .models import Seo

def seo_meta(request):
    '''Выводим meta данные'''
    meta = {}
    for m in Seo.objects.all():
        meta['title'] = m.title
        meta['desc'] = m.desc
        meta['keywords'] = m.keywords
    return {'meta': meta}
