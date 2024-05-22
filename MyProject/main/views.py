from django.shortcuts import render
from .models import *
from .serializers import *

from rest_framework.views import APIView
from rest_framework.response import Response


def index(request):
    return render(request, 'main/index.html', )


def test(request):
    return render(request, 'main/test.html', )


# ****************************************
# *                                      *
# *             REST API                 *
# *                                      *
# ****************************************

# КАТЕГОРИИ ПО ГРУПИ
class CategorySerializerView(APIView):
    def get(self, request):
        queryset = Group.objects.order_by('id')
        serializer = GroupSerializer(queryset, many=True, context={"request": request})
        return Response(serializer.data)


# СТОКИ
class ItemSerializerView(APIView):
    def get(self, request, group, category, order):
        order_s = 'id'  # нови-->стари
        if order == 1:  # стари-->нови
            order_s = '-id'
        if order == 2:  # име A - Z
            order_s = 'name'
        if order == 3:  # име Z - A
            order_s = '-name'
        if order == 4:  # цена ниска-->висока
            order_s = 'price'
        if order == 5:  # цена висока-->ниска
            order_s = '-price'

        if group == 0:
            queryset = Item.objects.order_by(order_s)
        elif category == 0:
            queryset = Item.objects.filter(group=group).order_by(order_s)
        else:
            queryset = Item.objects.filter(group=group).filter(category=category).order_by(order_s)

        serializer = ItemSerializer(queryset, many=True, context={"request": request})
        return Response(serializer.data)
