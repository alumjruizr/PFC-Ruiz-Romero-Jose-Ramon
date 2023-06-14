from polymorphic.query import PolymorphicModelIterable
from rest_framework.decorators import action
from rest_framework import status
from django.db.migrations import serializer
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet
from roleapp.models import *
from roleapp.api.serializers import *
from rest_framework.permissions import IsAuthenticatedOrReadOnly, IsAdminUser


class CharacterSheetApiView(ModelViewSet):
    permission_classes = [IsAuthenticatedOrReadOnly]
    serializer_class = ModelCharacterSheetSerializer
    queryset = CharacterSheet.objects.all()


class ItemApiView(ModelViewSet):
    permission_classes = [IsAuthenticatedOrReadOnly]
    serializer_class = ModelItemSerializer
    queryset = Item.objects.all()


class WeaponApiView(ModelViewSet):
    permission_classes = [IsAuthenticatedOrReadOnly]
    serializer_class = ModelWeaponSerializer
    queryset = Weapon.objects.all()


class MagicItemApiView(ModelViewSet):
    permission_classes = [IsAuthenticatedOrReadOnly]
    serializer_class = ModelMagicItemSerializer
    queryset = MagicItem.objects.all()


class ArmorApiView(ModelViewSet):
    permission_classes = [IsAuthenticatedOrReadOnly]
    serializer_class = ModelArmorSerializer
    queryset = Armor.objects.all()


class RaceApiView(ModelViewSet):
    permission_classes = [IsAuthenticatedOrReadOnly]
    serializer_class = ModelRaceSerializer
    queryset = Race.objects.all()


class CharacterClassApiView(ModelViewSet):
    permission_classes = [IsAuthenticatedOrReadOnly]
    serializer_class = ModelCharacterClassSerializer
    queryset = CharacterClass.objects.all()


class UserApiView(ModelViewSet):
    permission_classes = [IsAuthenticatedOrReadOnly]
    serializer_class = ModelUserSerializer
    queryset = User.objects.all()

