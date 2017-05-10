from .models import Seo

# Выводим meta
def seo_meta(request):
    meta = {}
    for m in Seo.objects.all():
        meta['title'] = m.title
        meta['desc'] = m.desc
        meta['keywords'] = m.keywords
    return {'meta': meta}
