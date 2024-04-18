from django.contrib import admin
from .models import *

admin.site.register(Group)


@admin.register(Category)
class CarModelV(admin.ModelAdmin):
    list_display = ('id', 'name', 'group', )
    list_display_links = ('id', 'name')
    list_filter = ('group', )
    ordering = ('name',)


@admin.register(Item)
class ItemV(admin.ModelAdmin):
    list_display = ('id', 'name', 'price', 'price', 'new_item', 'group', 'category', )
    list_display_links = ('id', 'name')
    list_filter = ('group', 'category' )