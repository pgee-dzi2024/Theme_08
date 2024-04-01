from django.db import models


# Мебели (стоки).
class Item(models.Model):
    picture = models.ImageField('Снимка', upload_to='items', blank=True, help_text='Снимка на артикула')
    name = models.CharField('Наименование', max_length=100, default='', blank=True,
                            help_text='Наименование на артикула')
    price = models.DecimalField('Цена', max_digits=6, decimal_places=2, default=0, help_text='Цена на артикула')
    hits = models.IntegerField('Брой покупки', default=0, help_text='брой продадени (попълва се автоматично)')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Стока'
        verbose_name_plural = 'Стоки'


# Отзиви от клиенти
class Review(models.Model):
    txt = models.TextField('Текст', default='', blank=True, help_text='Текст на отзива')
    name = models.CharField('Име', max_length=50, default='', blank=True,
                            help_text='Име на автора на отзива')
    pos = models.CharField('Позиция', max_length=50, default='', blank=True,
                            help_text='длъжност и/или населено място и/или образование/професия')

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Отзив'
        verbose_name_plural = 'Отзиви'


# Поръчки
class OrderManager(models.Manager):
    def create_comment(self, values):
        item = self.create(first_name=values['first_name'],
                           last_name=values['last_name'],
                           company=values['company'],
                           address=values['address'],
                           email=values['email'],
                           phone=values['phone'],
                           note=values['note'],
                           order_details=values['order_details'],
                           )
        return item


class Order(models.Model):
    first_name = models.CharField('Собствено име', max_length=50, default='', blank=True)
    last_name = models.CharField('Фамилно име', max_length=50, default='', blank=True)
    company = models.CharField('Фирма', max_length=50, default='', blank=True)
    address = models.CharField('Адрес', max_length=100, default='', blank=True)
    email = models.CharField('Е-mail адрес', max_length=100, default='', blank=True)
    phone = models.CharField('Телефон', max_length=100, default='', blank=True)
    note = models.TextField('Бележки', default='', blank=True)
    order_details = models.TextField('Описание на поръчката', default='', blank=True)

    objects = OrderManager()

    def __str__(self):
        return f'{self.first_name} {self.last_name}'

    class Meta:
        verbose_name = 'Поръчка'
        verbose_name_plural = 'Поръчки'
