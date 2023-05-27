from django.contrib.auth import authenticate, login as auth_login
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.models import User
from django.http import HttpResponse, Http404
from django.shortcuts import render
# create your views here
from django.views.generic.base import View
from roleapp.models import *


def index(request):
    return render(request, 'index.html', {})


class RaceView(LoginRequiredMixin, View):

    def get(self, request):
        if request.user.is_authenticated:
            context = {
                'races': list(Race.objects.all()),
                'users': list(User.objects.all())
            }
            return render(request, 'race_list.html', context=context)
        raise Http404()


# def race_list(request):
# return render(request, 'roleapp/race_list.html', {})

class CharacterSheetView(LoginRequiredMixin, View):
    def get(self, request):
        if request.user.is_authenticated:
            context = {
                'name': characterSheet.name,
                'class': characterSheet.characterClass,
                'race': characterSheet.race}
            return render(request, 'characterSheetView.html', context=context)
        raise Http404
