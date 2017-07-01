# -*- coding: utf-8 -*-
from django.db.models.fields.files import ImageField, ImageFieldFile
from PIL import Image


def _add_thumb(s):
    """
    Модификация имени файла, путем добавления к нему приставки '.thumb'
    для превью
    """
    parts = s.split(".")
    parts.insert(-1, "thumb")
    if parts[-1].lower() not in ['jpeg', 'jpg']:
        parts[-1] = 'jpg'
    return ".".join(parts)


class ThumbnailImageFieldFile(ImageFieldFile):
    def _get_thumb_path(self):
        # print('self.path=', _add_thumb(self.path))
        return _add_thumb(self.path)

    thumb_path = property(_get_thumb_path)

    def _get_thumb_url(self):
        return _add_thumb(self.url)

    thumb_url = property(_get_thumb_url)

    @staticmethod
    def _scale_dimensions(width, height, longest_side=800):
        """
        Ресайз изображения до размера в 800 пикселей
        по длинной стороне
        """
        if width > height:
            coefficient = float(width) / float(longest_side)
            width = longest_side
            height = int(height / coefficient)
            return width, height
        elif width < height:
            coefficient = float(height) / float(longest_side)
            height = longest_side
            width = int(width / coefficient)
            return width, height
        else:
            return longest_side, longest_side

    def save(self, name, content, save=True):
        """ Сохранение изображения с новым именем и размером"""
        from datetime import datetime
        dt = str(datetime.now()).replace('-', '_')\
            .replace(':', '').replace(' ', '_')
        img_name = dt.replace('.', '_') + '.jpg'
        super(ThumbnailImageFieldFile, self).save(img_name, content, save)

        img = Image.open(self.path)
        (width, height) = img.size
        if width > 800 or height > 800:
            (width, height) = self._scale_dimensions(width, height)
        newImg = img.resize((width, height), Image.ANTIALIAS)
        newImg.save(self.path, 'JPEG')
        img.thumbnail(
            (self.field.thumb_width, self.field.thumb_height),
            Image.ANTIALIAS
        )
        img.save(self.thumb_path, 'JPEG')


class ThumbnailImageField(ImageField):
    """
    Создание превью изображения
    """
    attr_class = ThumbnailImageFieldFile

    def __init__(self, thumb_width=250, thumb_height=250, *args, **kwargs):
        # self.img_name = img_name
        self.thumb_width = thumb_width
        self.thumb_height = thumb_height

        super(ThumbnailImageField, self).__init__(*args, **kwargs)
