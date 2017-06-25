from django.db import models
from django.utils import timezone


class Contact(models.Model):
    ''' Модель обратной связи '''
    class Meta:
        db_table = 'contact'
        verbose_name = "Обратная связь"
        verbose_name_plural = "Обратная связь"

    name = models.CharField("Имя", max_length=30)
    tel = models.CharField("Телефон", max_length=30)
    email = models.EmailField(max_length=70)
    message = models.TextField("Сообщение", max_length=1000)
    data = models.DateTimeField("Дата отправки", default=timezone.now)

    def __str__(self):
        return self.name
