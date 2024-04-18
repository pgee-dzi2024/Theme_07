from rest_framework import serializers
from .models import *


# Сериализатор  КАТЕГОРИИ
class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = "__all__"


# Сериализатор  ГРУПИ
class GroupSerializer(serializers.ModelSerializer):
    group_rn = CategorySerializer(many=True)

    class Meta:
        model = Group
        fields = "__all__"


# Сериализатор  Стоки
class ItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = Item
        fields = "__all__"
        depth = 1

