from rest_framework.routers import DefaultRouter
from roleapp.api.views import *


router = DefaultRouter()

router.register(prefix='raceList', basename='raceList', viewset=RaceListApiView)
router.register(prefix='characterClass', basename='characterClass', viewset=CharacterClassApiView)
router.register(prefix='characterSheet', basename='characterSheet', viewset=CharacterSheetApiView)
router.register(prefix='item', basename='item', viewset=ItemApiView)
router.register(prefix='weapon', basename='weapon', viewset=WeaponApiView)
router.register(prefix='armor', basename='armor', viewset=ArmorApiView)
router.register(prefix='magicItem', basename='magicItem', viewset=MagicItemApiView)
router.register(prefix='user', basename='user', viewset=UserApiView)
