from simple_history.models import HistoricalRecords

from django.db import models
from django.core.urlresolvers import reverse
from django.utils import timezone
from django.contrib.auth import get_user_model
from django.conf import settings

from myclient.models import Okrug, Naznach


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

    my_manager = models.ForeignKey(settings.AUTH_USER_MODEL,
                                   on_delete=models.SET(get_sentinel_user))
    typeobj = models.CharField("Тип объекта", max_length=30,
                               choices=TYPE_OBJ, default="0")
    okrug = models.ManyToManyField(Okrug, blank=True, verbose_name="Округ")
    adres = models.CharField("Адрес", max_length=100, blank=True)
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
        StancMetro, related_name='station_one', verbose_name="Станция сетро")
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
    history = HistoricalRecords(user_related_name="history_object")

    def __str__(self):
        return self.adres

    def get_absolute_url(self):
        return reverse('my_object')

    @staticmethod
    def _bootstrap(count=200, locale='ru'):
        import random
        boolean = [True, False]

        from elizabeth import Generic
        g = Generic(locale)

        naznach = Naznach(options='Магазин')
        naznach.save()

        okrug = Okrug(options='Шевченковский район')
        okrug.save()

        st_metro = StancMetro(color="красная", name="Лебедская")
        st_metro.save()

        User = get_user_model()
        users_list = User.objects.all()[:5]

        for u in users_list:
            for _ in range(count):
                block_area = g.numbers.floats(
                    n=2, type_code='f', to_list=True)[0] * 100
                block_price = g.numbers.floats(
                    n=2, type_code='f', to_list=True)[0] * 1000

                client = MyObject(
                    my_manager=u,
                    adres=g.address.address(),
                    area=120,
                    block_area=block_area,
                    block_price=block_price,
                    etaj=3,
                    price=2000,
                    opis=g.text.text(quantity=5),
                    station_one=st_metro,
                    dom=random.choice(boolean),
                    kvt="None",
                    dogovor="Dogovor",
                    block_name=random.choice(boolean),
                    block_tel=g.personal.telephone(),
                    block_email=g.personal.email(),
                    silka='http://silca.com',
                    zametka=g.text.text(quantity=7),
                )
                client.save()
                client.naznach.add(naznach)
                client.okrug.add(okrug)

    @staticmethod
    def _change(locale='ru'):
        from elizabeth import Generic
        g = Generic(locale)

        okrug = Okrug(options='Орджонекидзовский район')
        okrug.save()

        objects_list = MyObject.objects.all()[:20]
        for object in objects_list:
            object.okrug.add(okrug)
            object.block_tel = g.personal.telephone()
            object.block_email = g.personal.email()
            object.save()
