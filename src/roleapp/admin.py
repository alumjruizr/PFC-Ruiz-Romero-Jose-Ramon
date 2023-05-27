from django.contrib import admin
from .models import Race
from .models import CharacterClass
from .models import Item
from .models import Armor
from .models import Weapon
from .models import MagicItem
from .models import characterSheet

admin.site.register(CharacterClass)
admin.site.register(Item)
admin.site.register(Race)
admin.site.register(Armor)
admin.site.register(Weapon)
admin.site.register(MagicItem)
admin.site.register(characterSheet)

# Register your models here.
