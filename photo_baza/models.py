from django.db import models
from myobject.models import StancMetro
from django.dispatch import receiver
from .fields import ThumbnailImageField

# def update_filename(instance, filename):
#    from datetime import datetime
#    dt = str(datetime.now()).replace('-', '_')
# .replace(':', '').replace(' ', '_')
#    img_name = dt.replace('.', '_') + '.jpg'
#    path = "photo_baza"
#    return os.path.join(path, img_name)


# Модель фото базы
class Photo(models.Model):
    ''' Модель ФОТО БАЗЫ '''
    station = models.ForeignKey(StancMetro, db_index=True,
                                verbose_name="Станция")
    image = ThumbnailImageField(upload_to='photo_baza')
    is_main = models.BooleanField(default=False,
                                  verbose_name="Заглавная фотография")
    is_active = models.BooleanField(default=True)
    created = models.DateTimeField(auto_now_add=True,
                                   auto_now=False, editable=False)

    class Meta:
        db_table = 'photo_baza'
        verbose_name = 'Фото база'
        verbose_name_plural = 'Фото база'

    def __str__(self):
        return 'Фото для станции метро %s' % (self.station.name)


@receiver(models.signals.pre_delete, sender=Photo, weak=False)
def delete_photo(sender, instance, **kwargs):
    path_to_photo = instance.image.path
    path_to_thumb = path_to_photo[:-3] + 'thumb.' + path_to_photo[-3:]
    if os.path.exists(path_to_photo):
        os.remove(path_to_photo)
    if os.path.exists(path_to_thumb):
        os.remove(path_to_thumb)


@receiver(models.signals.pre_delete, sender=StancMetro, weak=False)
def delete_photos_from_album(sender, instance, **kwargs):
    photo_list = Photo.objects.filter(item=instance.id)
    for photo in photo_list:
        photo.delete()
