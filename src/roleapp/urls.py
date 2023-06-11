from django.urls import path, include
from django.contrib import admin
from roleapp.views import RaceView, CharacterSheetTemplate, CharacterSheetList
from users.views import LoginView, LogoutView, RegistrationView
from roleapp.api.views import RaceListApiView
from rest_framework.routers import *
from roleapp import views
from roleapp.api.router import router

urlpatterns = [
    path('', views.index, name='index'),
    path('raceList/', RaceView.as_view(), name='race_list'),
    path('login/', LoginView.as_view(), name="login"),
    path('registration/', RegistrationView.as_view(), name="registration"),
    path('logout/', LogoutView.as_view(), name="logout"),
    path('api/', include(router.urls)),
    path('characterSheetTemplate/', CharacterSheetTemplate.as_view(), name='character_sheet_template'),
    path('characterSheetList/', CharacterSheetList.as_view(), name='character_sheet_list')
]
