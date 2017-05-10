from django.db import models
from django.core.urlresolvers import reverse
from django.contrib.auth.models import User

# Модель назначения


class Naznach(models.Model):
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

# Модель округов


class Okrug(models.Model):
    class Meta():
        db_table = "okrug"
        verbose_name = "Округ"
        verbose_name_plural = "Округа"

    options = models.CharField("Округ", max_length=100)

    def __str__(self):
        return self.options

# Таблица клиентов
class Client(models.Model):
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
    my_manager = models.ForeignKey(User)
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

    def get_absolute_url(self):
        return reverse('my_client')  # , kwargs={'pk': self.pk})


# Модель задачи клиента
class TaskClient(models.Model):
    class Meta():
        db_table = "task_client"
        verbose_name = "Задача клиента"
        verbose_name_plural = "Задачи клиента"

    PRIORITET = (
        ('0', 'другое'),
        ('1', 'звонок, ответ'),
        ('2', 'первоочередное'),
        ('3', 'встреча, показ')
    )
    manager = models.ForeignKey(User, on_delete=models.CASCADE)
    client = models.ForeignKey(Client, verbose_name="Клиент")
    prioritet = models.CharField("Приоритет", max_length=30,
                                 choices=PRIORITET, default="0", blank=True)
    date = models.DateField("Дата", auto_now_add=False)
    task = models.TextField("Задача")

    def get_absolute_url(self):
        return reverse('my_client')
