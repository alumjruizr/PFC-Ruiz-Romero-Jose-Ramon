from django.contrib.auth import authenticate, login as auth_login
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.models import User
from django.http import HttpResponse, Http404
from django.shortcuts import render
from django.views.generic import ListView
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


class CharacterSheetTemplate(LoginRequiredMixin, View):

    def get(self, request):
        if request.user.is_authenticated:
            context = {
            }
            return render(request, 'characterSheetTemplate.html', context=context)
        raise Http404


class CharacterSheetList(LoginRequiredMixin, ListView):
    model = CharacterSheet

#    def get(self, request):
#        if request.user.is_authenticated:
#            context = {
#                'characterSheets': list(CharacterSheet.objects.all().filter(user_id=self.request.user.id))
#            }
#            return render(request, 'characterSheetList.html', context=context)

    def get_queryset(self):
        if user.is_authenticated:
            return CharacterSheet.objects.all().filter(user_id=self.user.id)
        raise Http404
