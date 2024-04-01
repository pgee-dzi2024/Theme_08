from django.contrib import admin
from .models import Item, Order, Review


@admin.register(Item)
class ImportantV(admin.ModelAdmin):
    list_display = ('id', 'name', 'price', 'hits')
    list_display_links = ('name', )


@admin.register(Review)
class ImportantV(admin.ModelAdmin):
    list_display = ('id', 'name', 'txt', )
    list_display_links = ('name', )


@admin.register(Order)
class ImportantV(admin.ModelAdmin):
    list_display = ('id', 'order_details', 'first_name', 'last_name', 'company', )
    list_display_links = ('order_details', )
