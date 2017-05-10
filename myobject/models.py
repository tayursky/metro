from django.db import models
from django.contrib.auth.models import User
from myclient.models import Okrug, Naznach
from django.core.urlresolvers import reverse
from django.utils import timezone

# Станции метро
class StancMetro(models.Model):
    class Meta():
        db_table = "metro"
        verbose_name = "Стация метро"
        verbose_name_plural = "Станции метро"

    okrug = models.ManyToManyField(Okrug, blank=True, verbose_name="Округ")
    color = models.CharField("Цвет ветки", max_length=100)
    name = models.CharField("Станция", max_length=100)

    def __str__(self):
        return self.name

# Модель объектов
class MyObject(models.Model):
    class Meta:
        db_table = "object"
        verbose_name = "Объект"
        verbose_name_plural = "Объекты"
        ordering = ['hide']

    TYPE_OBJ = (
        ('1', 'Павильон'),
        ('2', 'Капитальное'),
        ('3', 'Отдел\БЦ\ТЦ'),
        ('4', 'Подземка')
    )

    HIDE = (
        ('no', 'Не скрыт'),
        ('yes', 'Скрыт')
    )

    my_manager = models.ForeignKey(User, related_name='my_manager')
    typeobj = models.CharField("Тип объекта", max_length=30, choices=TYPE_OBJ, default="0")
    okrug = models.ManyToManyField(Okrug, blank=True, verbose_name="Округ")
    adres = models.CharField("Адрес", max_length=100, blank=True)
    naznach = models.ManyToManyField(Naznach, verbose_name="Назначение")
    area = models.IntegerField("Площадь", default=0)
    block_area = models.FloatField("Метраж", default=0, blank=True)
    block_price = models.FloatField("Цена", default=0, blank=True)
    block_procent = models.FloatField("Процент комиссии", default=0, blank=True)
    etaj = models.IntegerField("Этаж", default=0, blank=True)
    price = models.IntegerField("Цена", default=0)
    opis = models.TextField("Описание", max_length=1000, blank=True)
    station_one = models.ForeignKey(
        StancMetro, related_name='station_one', verbose_name="Станция сетро")
    station_two = models.ForeignKey(StancMetro, blank=True, null=True, verbose_name="Станция метро доп.")
    dom = models.BooleanField("Дом", default=False, blank=True)
    kvt = models.CharField("КВт", max_length=50, blank=True)
    dogovor = models.CharField("Тип договора", max_length=50, blank=True)
    block_name = models.CharField("Имя", max_length=20, blank=True)
    block_tel = models.CharField("Телефон", max_length=20, blank=True)
    block_email = models.EmailField("Email", max_length=30, blank=True)
    silka = models.CharField("Ссылка на сайт", max_length=200, blank=True)
    zametka = models.TextField("Заметка", max_length=1000, blank=True)
    hide = models.CharField("Скрыт", max_length=30, choices=HIDE, default="0", blank=True)
    hide_date = models.DateField("Скрыть до", auto_now_add=False, blank=True, null=True)
    zvon = models.DateField("Скрыть до", default=timezone.now(), blank=True)

    def get_absolute_url(self):
        return reverse('my_object')
