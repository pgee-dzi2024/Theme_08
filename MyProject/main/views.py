from django.shortcuts import render
from .models import *
from rest_framework.views import APIView
from rest_framework.response import Response
from .serializers import *

def index(request):
    items = Item.objects.order_by('-hits')
    reviews = Review.objects.all()
    menu = {
            "home": 'active',
            "shop": '',
            "catalog": '',
            "about": '',
            "contact": '',
           }

    context = {
        'page_title': 'Съвременни мебели с уникален дизайн',
        'page_subtitle': 'Актуален дизайн, високо качество на  изработката, качествени материали.',
        'items': items,
        'reviews': reviews,
        'menu_status': menu,
    }
    return render(request, 'main/index.html', context)


def shop(request):
    menu = {
            "home": '',
            "shop": 'active',
            "catalog": '',
            "about": '',
            "contact": '',
           }

    context = {
        'page_title': 'Магазин',
        'page_subtitle': 'Компетентни консултанти, голяма експозиция. Зповядайте! ',
        'menu_status': menu,
    }
    return render(request, 'main/shop.html', context)


def catalog(request):
    menu = {
            "home": '',
            "shop": '',
            "catalog": 'active',
            "about": '',
            "contact": '',
           }

    context = {
        'page_title': 'Съвременни мебели с уникален дизайн',
        'page_subtitle': 'Ние правим Вашия интериор по - добър',
        'menu_status': menu,
    }
    return render(request, 'main/catalog.html', context)


def about(request):
    menu = {
            "home": '',
            "shop": '',
            "catalog": '',
            "about": 'active',
            "contact": '',
           }
    reviews = Review.objects.all()

    context = {
        'page_title': 'За нас',
        'page_subtitle': 'Ние правим Вашия интериор по-добър.',
        'menu_status': menu,
        'reviews': reviews,
    }
    return render(request, 'main/about.html', context)


def contact(request):
    menu = {
            "home": '',
            "shop": '',
            "catalog": '',
            "about": '',
            "contact": 'active',
           }

    context = {
        'page_title': 'Свържете се с нас',
        'page_subtitle': 'Ако имате въпроси относно продукти или промоции, свържете се с нас на посочените координати '
                         'или ни пишете директно във формата за контакти.',
        'menu_status': menu,
    }
    return render(request, 'main/contact.html', context)


# R E S T   У С Л У Г И
# Връща списък на артикулите
class ItemsSerializerView(APIView):
    def get(self, request):
        queryset = Item.objects.order_by('-hits')
        serializer = ItemsSerializer(queryset, many=True, context={"request": request})
        return Response(serializer.data)


# Записва поръчка
class SaveOrderView(APIView):
    def post(self, request):
        data = {
            'first_name': request.data['first_name'],
            'last_name': request.data['last_name'],
            'company': request.data['company'],
            'address': request.data['address'],
            'email': request.data['first_name'],
            'phone': request.data['first_name'],
            'note': request.data['first_name'],
            'order_details': request.data['order_details'],
        }
        new_order = Order.objects.create_comment(data)
        print("comment -> ", new_order)
        return Response(status=201)
