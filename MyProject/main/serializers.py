from rest_framework import serializers
from .models import Item


# Сериализатор  КАТЕГОРИИ
class ItemsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Item
        fields = "__all__"
