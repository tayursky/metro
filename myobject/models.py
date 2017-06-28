from django.db import models
from django.core.urlresolvers import reverse
from django.utils import timezone
from django.contrib.auth import get_user_model
from django.conf import settings

from myclient.models import Okrug, Naznach, HistoricalRecordsExtended


def get_sentinel_user():
    return get_user_model().objects.get_or_create(username='deleted')[0]


class StancMetro(models.Model):
    '''Станции метро'''
    class Meta():
        db_table = "metro"
        verbose_name = "Стация метро"
        verbose_name_plural = "Станции метро"

    okrug = models.ManyToManyField(Okrug, blank=True, verbose_name="Округ")
    color = models.CharField("Цвет ветки", max_length=100)
    name = models.CharField("Станция", max_length=100)

    def __str__(self):
        return self.name


class MyObject(models.Model):
    '''Модель объектов'''
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
        ('no', 'Нет'),
        ('yes', 'Все')
    )

    RANGE_AREA = (
        ('small', 'Маленькое до 20 кв.м'),
        ('middle', 'Среднее от 20 до 80 кв.м'),
        ('large', 'Большое до 80 кв.м'),
    )

    my_manager = models.ForeignKey(settings.AUTH_USER_MODEL,
                                   on_delete=models.SET(get_sentinel_user))
    typeobj = models.CharField("Тип объекта", max_length=30,
                               choices=TYPE_OBJ, default="0")
    okrug = models.ManyToManyField(Okrug, blank=True, verbose_name="Округ")
    adres = models.CharField("Адрес", max_length=100)
    naznach = models.ManyToManyField(Naznach, verbose_name="Назначение")
    area = models.IntegerField("Площадь", default=0)
    block_area = models.FloatField("Метраж", default=0, blank=True)
    block_price = models.FloatField("Цена", default=0, blank=True)
    block_procent = models.FloatField("Процент комиссии",
                                      default=0, blank=True)
    etaj = models.IntegerField("Этаж", default=0, blank=True)
    price = models.IntegerField("Цена", default=0)
    opis = models.TextField("Описание", max_length=1000, blank=True)
    station_one = models.ForeignKey(
        StancMetro, related_name='station_one', verbose_name="Станция метро")
    station_two = models.ForeignKey(StancMetro, blank=True, null=True,
                                    verbose_name="Станция метро доп.")
    dom = models.BooleanField("Дом", default=False, blank=True)
    kvt = models.CharField("КВт", max_length=50, blank=True)
    dogovor = models.CharField("Тип договора", max_length=50, blank=True)
    block_name = models.CharField("Имя", max_length=20, blank=True)
    block_tel = models.CharField("Телефон", max_length=20, blank=True)
    block_email = models.EmailField("Email", max_length=30, blank=True)
    silka = models.CharField("Ссылка на сайт", max_length=200, blank=True)
    zametka = models.TextField("Заметка", max_length=1000, blank=True)
    hide = models.CharField("Скрыт", max_length=30, choices=HIDE,
                            default="0", blank=True)
    hide_date = models.DateField("Скрыть до", auto_now_add=False,
                                 blank=True, null=True)
    zvon = models.DateField("Скрыть до", default=timezone.now, blank=True)
    history = HistoricalRecordsExtended(user_related_name="history_object")
    area_range = models.CharField(choices=RANGE_AREA,
                                  max_length=50, blank=True, null=True)

    def __str__(self):
        return self.adres

    def get_absolute_url(self):
        return reverse('my_object')

    def save(self, *args, **kwargs):
        if self.area <= 20:
            self.area_range = 'small'
        elif self.area >= 80:
            self.area_range = 'large'
        else:
            self.area_range = 'middle'
        super().save(*args, **kwargs)
