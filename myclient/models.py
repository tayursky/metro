from simple_history.models import HistoricalRecords

from django.db import models
from django.core.urlresolvers import reverse
from django.contrib.auth.models import User
from django.contrib.auth import get_user_model
from django.conf import settings


class Naznach(models.Model):
    ''' Модель назначения '''
    class Meta():
        db_table = "naznach"
        verbose_name = "Назначение"
        verbose_name_plural = "Назначения"

    GROUP = (
        ('Продукты', 'Продукты'),
        ('Общепит', 'Общепит'),
        ('Другое', 'Другое')
    )

    group = models.CharField("Группа", max_length=30, choices=GROUP, default="F")
    options = models.CharField("Назначения", max_length=100)

    def __str__(self):
        return self.options


class Okrug(models.Model):
    ''' Модель округов '''
    class Meta():
        db_table = "okrug"
        verbose_name = "Округ"
        verbose_name_plural = "Округа"

    options = models.CharField("Округ", max_length=100)

    def __str__(self):
        return self.options

def get_sentinel_user():
    return get_user_model().objects.get_or_create(username='deleted')[0]


class Client(models.Model):
    ''' Таблица клиентов '''
    class Meta():
        db_table = "client"
        verbose_name = "Клиент"
        verbose_name_plural = "Клиенты"
        ordering = ['hide']

    HIDE = (
        ('no', 'Не скрыт'),
        ('yes', 'Скрыт')
    )

    OKRUG_OPTIONS = (
        ('1', 'Центр'),
        ('2', 'Север'),
        ('3', 'Юг'),
        ('4', 'Восток'),
        ('5', 'Запад'),
        ('6', 'Область')
    )

    TYPE_OBJ = (
        ('undeg', 'Подземка'),
        ('street', 'Улица'),
        ('tc', 'Отдел\ТЦ')
    )
    my_manager = models.ForeignKey(settings.AUTH_USER_MODEL,
        on_delete=models.SET(get_sentinel_user),)
    name = models.CharField("Имя", max_length=30)
    tel = models.CharField("Телефон", max_length=30, blank=True)
    email = models.EmailField("Email", max_length=30, blank=True)
    hide = models.CharField("Скрыт", max_length=30, choices=HIDE, default="0", blank=True)
    hide_date = models.DateField("Скрыть до", auto_now_add=False, blank=True, null=True)
    naznach_one = models.ForeignKey(
        Naznach, related_name='naznach_one', verbose_name="Назначение №1")
    naznach_two = models.ForeignKey(Naznach, blank=True, null=True, verbose_name="Назначение №2")
    area_ot = models.IntegerField("Площадь от", default=0, blank=True)
    area_do = models.IntegerField("Площадь до", default=0, blank=True)
    price_obsh = models.IntegerField("Цена до", default=0, blank=True)
    price_m = models.IntegerField("Цена до за м2", default=0, blank=True)
    dop_kont = models.TextField("Дополнительные контакты", max_length=1000, blank=True)
    metro = models.BooleanField("У метро", max_length=30, blank=True)
    adres = models.BooleanField("С адресом", max_length=100, blank=True)
    komisiya = models.BooleanField("Без комиссии", max_length=30, blank=True)
    etaj = models.BooleanField("1 этаж", max_length=30, blank=True)
    podborka = models.BooleanField("Отправить подборку", max_length=30, blank=True)
    # okrug = models.CharField("Округ", max_length=30, choices=OKRUG_OPTIONS,
    # default="", blank=True)
    okrug = models.ManyToManyField(Okrug, blank=True, verbose_name="Округ")
    type_obj = models.CharField("Тип объекта", max_length=30,
                                choices=TYPE_OBJ, default="undeg", blank=True)
    history = HistoricalRecords(user_related_name="history_client")

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('my_client', kwargs={'pk': self.my_manager.id})


class Prioritet(models.Model):
    ''' Модель приоритетов '''
    class Meta():
        db_table = "prioritet"
        verbose_name = "Приоритет"
        verbose_name_plural = "Приоритеты"
        ordering = ['-num']

    prioritet = models.CharField("Приоритет", max_length=30)
    num = models.IntegerField("Важность", default=1)

    def get_absolute_url(self):
        return reverse('prioritet')

    def __str__(self):
        return self.prioritet


class TaskClient(models.Model):
    ''' Модель задачи клиента '''    
    class Meta():
        db_table = "task_client"
        verbose_name = "Задача клиента"
        verbose_name_plural = "Задачи клиента"
        ordering = ['-prioritet']

    '''При удалении приоритета назначаем задачам другой приоритет'''

    def get_prio():
        prio = Prioritet.objects.get_or_create(prioritet='Другое10', num=0)[0]
        return prio

    '''PRIORITET = (
        ('0', 'другое'),
        ('1', 'звонок, ответ'),
        ('2', 'встреча, показ'),
        ('3', 'первоочередное')
    )'''
    manager = models.ForeignKey(User, on_delete=models.CASCADE)
    client = models.ForeignKey(Client, verbose_name="Клиент")# related_name='client',
    prioritet = models.ForeignKey(Prioritet, verbose_name="Приоритет")
    date = models.DateField("Дата", auto_now_add=False)
    task = models.TextField("Задача")
    end = models.BooleanField("Выполнено", default=False)

    def get_absolute_url(self):
        return reverse('my_client')

    def __str__(self):
        return "Задача"
