import json
import ast

from simple_history.models import HistoricalRecords

from django.db import models
from django.core.urlresolvers import reverse
from django.contrib.auth.models import User
from django.contrib.auth import get_user_model
from django.conf import settings
from django.utils.translation import gettext_lazy as _
from django.utils.text import get_text_list
from django.utils.translation import ugettext


# Расширеная модель для записи изменений в зарегистрированых моделях
class HistoricalRecordsExtended(HistoricalRecords):
    # Add extra field for change message
    def get_extra_fields(self, model, fields):
        extra_fields = super(
            HistoricalRecordsExtended, self).get_extra_fields(model, fields)
        extra_fields['change_message'] = models.TextField(
            _('change message'), blank=True)
        return extra_fields

    # Override create_historical_record for records change_message
    def create_historical_record(self, instance, history_type):
        super(HistoricalRecordsExtended, self).create_historical_record(
            instance, history_type)

        manager = getattr(instance, self.manager_name)
        history_list = manager.order_by('-history_date')

        change_message = []
        if history_list:
            last_record = history_list[0]
            if len(history_list) < 2:
                change_message.append({'added': {}})
                last_record.change_message = change_message
                last_record.save()
                return

            h_last, h_penultimate = list(history_list.values()[:2])

            change = []
            for field in self.fields_included(instance):
                if field.attname != 'change_message':
                    if (h_last[field.attname] != h_penultimate[field.attname]):
                        change.append(field.verbose_name)
            change_message.append({'changed': {'fields': change}})
            last_record.change_message = change_message
            last_record.save()

    # Override create_history_model:  create get_change_message method
    def create_history_model(self, model):
        model = super(HistoricalRecordsExtended, self).create_history_model(model)
        def get_change_message(self):
            """
            If self.change_message is a JSON structure, interpret it as a change
            string, properly translated.
            """

            if self.change_message and self.change_message[0] == '[':
                try:
                    json_data = ast.literal_eval(self.change_message)
                    msg = json.dumps(json_data)
                    change_message = json.loads(msg)
                except ValueError:
                    return self.change_message
                messages = []
                for sub_message in change_message:
                    if 'added' in sub_message:
                        if sub_message['added']:
                            sub_message['added']['name'] = ugettext(sub_message['added']['name'])
                            messages.append(ugettext('Added {name} "{object}".').format(**sub_message['added']))
                        else:
                            messages.append(ugettext('Added.'))

                    elif 'changed' in sub_message:
                        sub_message['changed']['fields'] = get_text_list(
                            sub_message['changed']['fields'], ugettext('and')
                        )
                        if 'name' in sub_message['changed']:
                            sub_message['changed']['name'] = ugettext(sub_message['changed']['name'])
                            messages.append(ugettext('Changed {fields} for {name} "{object}".').format(
                                **sub_message['changed']
                            ))
                        else:
                            messages.append(ugettext('Changed {fields}.').format(**sub_message['changed']))

                    elif 'deleted' in sub_message:
                        sub_message['deleted']['name'] = ugettext(sub_message['deleted']['name'])
                        messages.append(ugettext('Deleted {name} "{object}".').format(**sub_message['deleted']))

                change_message = ' '.join(msg[0].upper() + msg[1:] for msg in messages)
                return change_message or ugettext('No fields changed.')
            else:
                return self.change_message

        setattr(model, 'get_change_message', get_change_message)

        return model


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

def get_sentinel_user():
    return get_user_model().objects.get_or_create(username='deleted')[0]

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
    history = HistoricalRecordsExtended(user_related_name="history_client")

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('my_client', kwargs={'pk': self.my_manager.id})


    @staticmethod
    def _bootstrap(count=200, locale='ru'):
        import random
        boolean = [True, False]

        from elizabeth import Generic
        g = Generic(locale)

        naznach = Naznach(options='Магазин')
        naznach.save()

        User = get_user_model()
        for _ in range(10):
            user = User.objects.create_user(
                g.personal.username(), g.personal.email(), '123')
            user.save()

        users_list = User.objects.all()[:5]
        for u in users_list:
            for _ in range(count):
                area_ot = g.numbers.floats(n=2, type_code='f', to_list=True)[0] * 100
                area_do = area_ot + 100
                client = Client(
                    my_manager=u,
                    name=g.personal.name(),
                    tel=g.personal.telephone(),
                    email=g.personal.email(),
                    naznach_one=naznach,
                    area_ot=area_ot,
                    area_do=area_do,
                    metro=random.choice(boolean),
                    adres=random.choice(boolean),
                    komisiya=random.choice(boolean),
                    etaj=random.choice(boolean),
                    podborka=random.choice(boolean)
                )
                client.save()

    @staticmethod
    def _change(locale='ru'):
        from elizabeth import Generic
        g = Generic(locale)

        okrug = Okrug(options='Шевченковский район')
        okrug.save()

        clients_list = Client.objects.all()[:20]
        for client in clients_list:
            client.tel = g.personal.telephone()
            client.okrug.add(okrug)
            client.email = g.personal.email()
            client.save()


# Модель приоритетов
class Prioritet(models.Model):
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


# Модель задачи клиента
class TaskClient(models.Model):
    class Meta():
        db_table = "task_client"
        verbose_name = "Задача клиента"
        verbose_name_plural = "Задачи клиента"
        ordering = ['-prioritet']

    '''При удалении приоритета назначаем задачам другой приоритет'''

    def get_prio():
        try:
            prio = Prioritet.objects.all().order_by('-num')[:-1]
        except:
            prio = Prioritet.objects.get_or_create(prioritet='Другое10', num=0)[0]
        return prio

    def prio():
        b = 2
        return b

    '''PRIORITET = (
        ('0', 'другое'),
        ('1', 'звонок, ответ'),
        ('2', 'встреча, показ'),
        ('3', 'первоочередное')
    )'''
    manager = models.ForeignKey(User, on_delete=models.CASCADE)
    client = models.ForeignKey(Client, verbose_name="Клиент")# related_name='client',
    prioritet = models.ForeignKey(Prioritet, on_delete=models.SET(prio), verbose_name="Приоритет")
    date = models.DateField("Дата", auto_now_add=False)
    task = models.TextField("Задача")
    end = models.BooleanField("Выполнено", default=False)

    def get_absolute_url(self):
        return reverse('my_client')

    def __str__(self):
        return "Задача"
