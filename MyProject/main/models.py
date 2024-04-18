from django.db import models


# Групи
class Group(models.Model):
    name = models.CharField('Име', max_length=50, default='', blank=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Група стоки'
        verbose_name_plural = 'Групи стоки'


# Категории
class Category(models.Model):
    name = models.CharField('Име', max_length=50, default='', blank=True)
    group = models.ForeignKey(Group, verbose_name='Категория', on_delete=models.CASCADE, null=True, related_name='group_rn')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Категория стоки'
        verbose_name_plural = 'Категории стоки'


# Стоки
class Item(models.Model):
    name = models.CharField('Име', max_length=100, default='', blank=True)
    description = models.TextField('Описание', default='', blank=True, help_text='Текст на отзива')
    price = models.DecimalField('Цена', max_digits=6, decimal_places=2, default=0)
    new_item = models.BooleanField('Нов продукт', default=True)
    group = models.ForeignKey(Group, verbose_name='Група', on_delete=models.CASCADE, null=True, related_name='in_group')
    category = models.ForeignKey(Category, verbose_name='Категория', on_delete=models.CASCADE, null=True, related_name='in_category')
    photo = models.ImageField('Снимка', upload_to='items', blank=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Стока'
        verbose_name_plural = 'Стоки'
