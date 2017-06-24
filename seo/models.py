from django.db import models
from django.contrib.auth.models import User

class Seo(models.Model):
    '''Модель META\SEO настроект'''
    class Meta:
        db_table = 'seo'
        verbose_name = "Настрока сайта\SEO"
        verbose_name_plural = "Настроки сайта\SEO"

    title = models.CharField("Meta Title", max_length=200)
    desc = models.TextField("Meta Description", max_length=100)
    keywords = models.TextField("Meta Keywords", max_length=500)

    def __str__(self):
        return 'SEO настройки %s' % (self.title,)

class MenagerOptions(models.Model):
    '''Модель настройки прав менеджеров'''
    class Meta:
        db_table = 'manager_options'
        verbose_name = "Настроки прав"
        verbose_name_plural = "Настроки прав"

    user = models.OneToOneField(User)
    name = models.CharField("Имя", max_length=20)
    tel = models.CharField("Телефон", max_length=20)
    tel_vlad = models.BooleanField("Видеть телефон собственика", default=False)
    del_obj = models.BooleanField("Удалять любой объект", default=False)
    edit_obj = models.BooleanField("Редактировать любой объект", default=False)
    look = models.BooleanField("Видит чужих клиентов", default=False)

    def __str__(self):
        return self.user.username

class Cian(models.Model):
    '''Логин пароль ЦИАН'''
    class Meta:
        db_table = 'cian'
        verbose_name = "Настройки циан"
        verbose_name_plural = "Настройки циан"

    login = models.CharField("ID пользователя", max_length=30)
    password = models.CharField("Пароль", max_length=30)
    tel = models.CharField("Телефон", max_length=30)

    def __str__(self):
        return self.login
