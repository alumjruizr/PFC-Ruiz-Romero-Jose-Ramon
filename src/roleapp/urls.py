from django.urls import path, include
from django.contrib import admin
from rest_framework.documentation import include_docs_urls
from roleapp.views import CharacterSheetListView, CharacterSheetDetailView, CharacterSheetTemplateView, CharacterSheetCreateView
from users.views import LoginView, LogoutView, RegistrationView
from roleapp.api.views import RaceApiView
from rest_framework.routers import *
from roleapp import views
from roleapp.api.router import router
from users.views import signup

urlpatterns = [
    path('', LoginView.as_view(), name='index'),
    path('login/', LoginView.as_view(), name="login"),
    path('registration/', signup, name="registration"),
    path('docs/', include_docs_urls(title="RoleApp API", public=True)),
    path('logout/', LogoutView.as_view(), name="logout"),
    path('api/', include(router.urls)),
    path('characterSheetList/', CharacterSheetListView.as_view(), name='character_sheet_list'),
    path('characterSheet/detail/<int:pk>/', CharacterSheetDetailView.as_view(), name='charactersheet-detail-view'),
    path('characterSheet/edit/<int:pk>/', views.edit_charactersheet, name='charactersheet-edit-view'),
    path('characterSheet/create/', CharacterSheetCreateView.as_view(), name='charactersheet-create-view'),
    #path('characterSheet/delete/<int:pk>/', CharacterSheetDeleteView.as_view(), name='charactersheet-delete-view'),
    path('characterSheetExample/', CharacterSheetTemplateView.as_view(), name='charactersheet-template-view'),
]
