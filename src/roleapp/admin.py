from django.contrib import admin
from .models import Race
from .models import CharacterClass
from .models import Armor
from .models import Weapon
from .models import MagicItem
from .models import CharacterSheet

admin.site.register(CharacterClass)
admin.site.register(Race)
admin.site.register(Armor)
admin.site.register(Weapon)
admin.site.register(MagicItem)
admin.site.register(CharacterSheet)

# Register your models here.
