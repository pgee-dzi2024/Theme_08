# Generated by Django 4.2.11 on 2024-03-26 19:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0006_alter_order_managers'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='order_details',
            field=models.TextField(blank=True, default='', verbose_name='Описание на поръчката'),
        ),
    ]