from django.db import models

class Seo(models.Model):
    class Meta:
        db_table = 'seo'
        verbose_name = "Настрока сайта\SEO"
        verbose_name_plural = "Настроки сайта\SEO"

    title = models.CharField("Meta Title", max_length=200)
    desc = models.TextField("Meta Description", max_length=100)
    keywords = models.TextField("Meta Keywords", max_length=500)

    def __str__(self):
        return 'SEO настройки %s' % (self.title,)
