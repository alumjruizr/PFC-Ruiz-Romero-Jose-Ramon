from typing import Dict
from rest_framework import serializers
from rest_framework.exceptions import ValidationError
from rest_framework.serializers import ModelSerializer, HyperlinkedModelSerializer, HyperlinkedIdentityField
from roleapp.models import *


class ModelCharacterSheetSerializer(serializers.ModelSerializer):
    # user = serializers.HyperlinkedIdentityField(
    #     view_name='user-detail',
    # )
    #
    # characterClass = serializers.HyperlinkedIdentityField(
    #     view_name='characterClass-detail',
    #
    # )
    #
    # race = serializers.HyperlinkedIdentityField(
    #     view_name='race-detail',
    #     read_only=False
    # )

    class Meta:
        model = CharacterSheet
        fields = ('id', 'user', 'name', 'characterClass', 'race', 'strength', 'dexterity', 'constitution', 'wisdom',
                  'intelligence', 'charisma', 'actualLevel', 'currentHitPoints', 'experiencePoints', 'isInspired',
                  'alignment', 'equipment')


class ModelItemSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Item
        fields = ('id', 'name', 'description')


class ModelWeaponSerializer(ModelItemSerializer):
    class Meta:
        model = Weapon
        fields = ('id', 'name', 'description', 'dice', 'attribute')


class ModelArmorSerializer(ModelItemSerializer):
    class Meta:
        model = Armor
        fields = ('id', 'name', 'description', 'armorClass', 'dexterityMod')


class ModelMagicItemSerializer(ModelItemSerializer):
    class Meta:
        model = MagicItem
        fields = ('id', 'name', 'description', 'rarity')


class ModelRaceSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Race
        fields = ('id', 'name')


class ModelCharacterClassSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = CharacterClass
        fields = ('id', 'name', 'hitDice')


class ModelUserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ('username', 'email')
