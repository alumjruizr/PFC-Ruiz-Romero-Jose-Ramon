from django.conf import settings
from django.conf import settings
from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from polymorphic.models import PolymorphicModel


# Modelo de raza
class Race(models.Model):
    id = models.AutoField(primary_key=True)
    RACE_NAMES = (
        ('Human', 'Human'),
        ('Half Orc', 'Half Orc'),
        ('Elf', 'Elf'),
        ('Dwarf', 'Dwarf'),
        ('Halfling', 'Halfling'),
    )
    name = models.CharField(max_length=30, choices=RACE_NAMES)
    subRace = models.TextField()

    def __str__(self):
        return self.name


# Modelo de clase
class CharacterClass(models.Model):
    id = models.AutoField(primary_key=True)
    CLASS_NAMES = (
        ('Barbarian', 'Barbarian'),
        ('Bard', 'Bard'),
        ('Cleric', 'Cleric'),
        ('Druid', 'Druid'),
        ('Fighter', 'Fighter'),
        ('Monk', 'Monk'),
        ('Paladin', 'Paladin'),
        ('Ranger', 'Ranger'),
        ('Rogue', 'Rogue'),
        ('Sorcerer', 'Sorcerer'),
        ('Warlock', 'Warlock'),
        ('Wizard', 'Wizard'),
    )
    name = models.CharField(max_length=30, choices=CLASS_NAMES)
    hitDice = models.CharField(max_length=4)

    def __str__(self):
        return self.name

    subClass = models.CharField(max_length=30)


# Modelo de objetos


class Item(PolymorphicModel):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50)
    description = models.TextField()


class Armor(Item):
    armorClass = models.IntegerField()
    dexterityMod = models.IntegerField()

    def __str__(self):
        return self.name


class Weapon(Item):
    ATTRIBUTE = (
        ('DEX', 'Dexterity'),
        ('STR', 'Strength')
    )

    attribute = models.CharField(max_length=20, choices=ATTRIBUTE, null=True)
    dice = models.CharField(max_length=4)

    def __str__(self):
        return self.name


class MagicItem(Item):
    RARITY = (
        ('Common', 'Common'),
        ('Uncommon', 'Uncommon'),
        ('Rare', 'Rare'),
        ('Very rare', 'Very rare'),
        ('Legendary', 'Legendary'),
        ('Artifact', 'Artifact'),
        ('Unknown', 'Unknown'),
    )
    rarity = models.CharField(max_length=20, choices=RARITY)

    def __str__(self):
        return self.name


# Modelo de la hoja de personaje
class CharacterSheet(models.Model):
    id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, related_name='user', on_delete=models.CASCADE)
    name = models.CharField(max_length=20)
    characterClass = models.ForeignKey('CharacterClass', related_name='characterClass', on_delete=models.CASCADE)
    race = models.ForeignKey('Race', related_name='race', on_delete=models.CASCADE)
    strength = models.IntegerField()
    dexterity = models.IntegerField()
    constitution = models.IntegerField()
    wisdom = models.IntegerField()
    intelligence = models.IntegerField()
    charisma = models.IntegerField()
    actualLevel = models.IntegerField()
    currentHitPoints = models.IntegerField()
    experiencePoints = models.IntegerField(default=0)
    isInspired = models.BooleanField(default=False)
    alignment = models.CharField(max_length=20, default="Neutral")
    equipment = models.ManyToManyField('Item', blank=True, related_name='equipment')

    def __str__(self):
        return self.name
