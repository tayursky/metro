from django import template

register = template.Library()


@register.filter
def admin_url_obj(value, arg):
    return 'admin:%s_%s_%s' % (value._meta.app_label, value._meta.model_name, arg)
