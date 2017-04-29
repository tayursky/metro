from django.db import models
from django.contrib.auth.models import User

# Таблица клиентов


class Client(models.Model):
    class Meta():
        db_table = "client"
        verbose_name = "Клиент"
        verbose_name_plural = "Клиенты"

    HIDE = (
        ('yes', 'Скрыт'),
        ('no', 'Не скрыт')
    )

    manager = models.ForeignKey('auth.User')
    name = models.CharField("Имя", max_length=30)
    tel = models.CharField("Телефон", max_length=30)
    email = models.EmailField()
    hide = models.CharField("Скрыт", max_length=30, choices=HIDE, default="Выбор")
    naznach_one = models.CharField("Назначение №1", max_length=30)
    naznach_two = models.CharField("Назначение №2", max_length=30)