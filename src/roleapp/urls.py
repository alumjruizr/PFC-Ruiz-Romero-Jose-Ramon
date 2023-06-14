from django.urls import path, include
from django.contrib import admin
from roleapp.views import  CharacterSheetListView, CharacterSheetDetailView, CharacterSheetUpdateView, CharacterSheetTemplateView, CharacterSheetCreateView
from users.views import LoginView, LogoutView, RegistrationView
from roleapp.api.views import RaceListApiView
from rest_framework.routers import *
from roleapp import views
from roleapp.api.router import router

urlpatterns = [
    path('', views.index, name='index'),
    path('login/', LoginView.as_view(), name="login"),
    path('registration/', RegistrationView.as_view(), name="registration"),
    path('logout/', LogoutView.as_view(), name="logout"),
    path('api/', include(router.urls)),
    path('characterSheetList/', CharacterSheetListView.as_view(), name='character_sheet_list'),
    path('characterSheet/detail/<int:pk>/', CharacterSheetDetailView.as_view(), name='charactersheet-detail-view'),
    path('characterSheet/edit/<int:pk>/', CharacterSheetUpdateView.as_view(), name='charactersheet-edit-view'),
    path('characterSheet/create/', CharacterSheetCreateView.as_view(), name='charactersheet-create-view'),
    path('characterSheetExample/', CharacterSheetTemplateView.as_view(), name='charactersheet-template-view'),
]
