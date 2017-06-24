from django.db import models


class BlackList(models.Model):
    ''' Модель черного списка '''
    class Meta:
        db_table = 'black_list'
        verbose_name = 'Черный список'
        verbose_name_plural = 'Черные списки'

    name = models.CharField("Имя", max_length=30)
    tel = models.CharField("Телефон", max_length=20)
    text = models.TextField("Заметка")
    data = models.DateTimeField("Дата", auto_now=True)

    def __str__(self):
        return self.tel
