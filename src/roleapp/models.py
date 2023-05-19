from django.conf import settings
from django.conf import settings
from django.db import models
from django.utils import timezone

#Modelo de usuario
class User(models.Model):
    id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=25)
    password = models.CharField(max_length=20)
    registerDate = models.DateTimeField(blank = True, null = True)

    def registered(self):
        self.registerDate = timezone.now()
        self.save()

    def __str__(self):
        return self.username

#Modelo de raza
class Race(models.Model):
    id = models.AutoField(primary_key=True)
    RACE_NAMES = (
        ('Human','Human'),
        ('Half Orc','Half Orc'),
        ('Elf', 'Elf'),
        ('Dwarf', 'Dwarf'),
        ('Halfling', 'Halfling'),
    )
    name = models.CharField(max_length=30, choices=RACE_NAMES)
    subRace = models.TextField()

    def __str__(self):
        return self.name
    
#Modelo de clase
class CharacterClass(models.Model):
    id = models.AutoField(primary_key=True)
    CLASS_NAMES = (
        ('Barbarian','Barbarian'),
        ('Bard','Bard'),
        ('Cleric','Cleric'),
        ('Druid','Druid'),
        ('Fighter','Fighter'),
        ('Monk','Monk'),
        ('Paladin','Paladin'),
        ('Ranger','Ranger'),
        ('Rogue','Rogue'),
        ('Sorcerer','Sorcerer'),
        ('Warlock','Warlock'),
        ('Wizard','Wizard'),
    )
    name = models.CharField(max_length=30, choices=CLASS_NAMES)
    hitDice = models.CharField(max_length = 4)

    def __str__(self):
        return self.name
    
    #FIXME: Arreglar el asignador de subclases
    def subclasses(self):
        if self.name == "Barbarian":
            return (
                ('Berserker','Berserker'),
                ('Totem Warrior','Totem Warrior'),
            )
        else:
            return (
                ('Prueba', 'Prueba'),
                ('Prueba2', 'Prueba2')
            )
    SUBCLASS_NAMES = subclasses(name)
    subClass = models.CharField(max_length=30, choices=SUBCLASS_NAMES) 
    
#Modelo de objetos
class Item(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50)
    description = models.TextField()

    def __str__(self):
        return self.name
    
class Armor(Item):
    armorClass = models.IntegerField()
    dexterityMod = models.IntegerField()

class Weapon(models.Model):
    class atribute(models.TextChoices):
        DEXTERITY = 'DEX', ('Dexterity')
        STRENGTH = 'STR', ('Strength')

    dice = models.CharField(max_length = 4)
    competence = models.BooleanField(default=False)

class MagicItem(models.Model):
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

#Modelo de la hoja de personaje
class characterSheet(models.Model):
    id = models.AutoField(primary_key=True)
    user = models.ForeignKey('User', on_delete=models.CASCADE)
    name = models.CharField(max_length=20)
    characterClass = models.ForeignKey('CharacterClass', on_delete=models.CASCADE)
    race = models.ForeignKey('Race', on_delete=models.CASCADE)
    strength = models.IntegerField()
    dexterity = models.IntegerField()
    constitution = models.IntegerField()
    wisdom = models.IntegerField()
    intelligence = models.IntegerField()
    charisma = models.IntegerField()
    actualLevel = models.IntegerField()
    equipment = models.ManyToManyField('Item', help_text="Añada un objeto")

    def __str__(self):
        return self.name
    
class Customer(models.Model):
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    type = models.CharField(max_length=10)
