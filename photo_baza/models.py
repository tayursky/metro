from django.db import models

# Модель фото базы
class Photo(models.Model):
    class Meta:
        db_table = 'photo_baza'
        verbose_name = 'Фото база'
        verbose_name_plural = 'Фото база'



    def __str__(self):
        pass
