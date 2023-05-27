from django.urls import path
from django.contrib import admin
from roleapp import views
from roleapp.views import RaceView, CharacterSheetView
from users.views import LoginView, LogoutView

urlpatterns = [
    path('', views.index, name='index'),
    path('raceList/', RaceView.as_view(), name='race_list'),
    path('characterSheetView/', CharacterSheetView.as_view(), name='character_sheet_view'),
    path('login/', LoginView.as_view(), name="login"),
    path('logout/', LogoutView.as_view(), name="logout"),
]
