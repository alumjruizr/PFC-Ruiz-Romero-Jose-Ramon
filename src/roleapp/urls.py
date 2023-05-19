from django.urls import path
from . import views

urlpatterns = [
    path('', views.race_list, name='race_list'),
]