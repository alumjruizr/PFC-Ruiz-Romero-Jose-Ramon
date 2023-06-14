from django.contrib.auth import authenticate, login as auth_login
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.models import User
from django.forms import formset_factory
from django.http import HttpResponse, Http404
from django.shortcuts import render, get_object_or_404, redirect
from django.urls import reverse, reverse_lazy
from django.views.generic import ListView, UpdateView, DetailView, CreateView
# create your views here
from django.views.generic.base import View
from rest_framework import reverse
from roleapp.models import *
from roleapp.forms import CharacterSheetForm, CharacterSheetCreationForm
from roleapp.models import CharacterClass


def index(request):
    return render(request, 'index.html', {})


class CharacterSheetTemplateView(LoginRequiredMixin, View):

    def get(self, request):
        if request.user.is_authenticated:
            context = {
                'characterSheets': list(CharacterSheet.objects.all().filter(user_id=1))
            }
            return render(request, 'characterSheetTemplate.html', context=context)
        raise Http404()


class CharacterSheetListView(LoginRequiredMixin, ListView):
    model = CharacterSheet

    def get(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            context = {
                'characterSheets': list(CharacterSheet.objects.all().filter(user_id=self.request.user.id)),
            }
            return render(request, 'charactersheet_list.html', context=context)


class CharacterSheetDetailView(LoginRequiredMixin, DetailView):
    model = CharacterSheet
    form_class = CharacterSheetForm
    success_url = reverse_lazy('charactersheet-detail-view')


class CharacterSheetUpdateView(LoginRequiredMixin, UpdateView):
    model = CharacterSheet
    form_class = CharacterSheetForm
    success_url = reverse_lazy('character_sheet_list')


class CharacterSheetCreateView(View):

    def get(self, request):
        return render(request, 'roleapp/charactersheet_create.html', context={'form': CharacterSheetCreationForm()})

    def post(self, request):
        charactercreation_formset = formset_factory(CharacterSheetCreationForm)(data=request.POST)
        data = {
            "form-TOTAL_FORMS": "1",
            "form-INITIAL_FORMS": "0",
        }
        for form in charactercreation_formset:
            if charactercreation_formset.is_valid():
                CharacterSheet.objects.create(
                    user_id=self.request.user.id,
                    name=form.cleaned_data['name'],
                    characterClass=form.cleaned_data['characterClass'],
                    race=form.cleaned_data['race'],
                    strength=form.cleaned_data['strength'],
                    dexterity=form.cleaned_data['dexterity'],
                    constitution=form.cleaned_data['constitution'],
                    wisdom=form.cleaned_data['wisdom'],
                    intelligence=form.cleaned_data['intelligence'],
                    charisma=form.cleaned_data['charisma'],
                    actualLevel=form.cleaned_data['actualLevel'],
                    currentHitPoints=form.cleaned_data['currentHitPoints'],
                    experiencePoints=form.cleaned_data['experiencePoints'],
                    alignment=form.cleaned_data['alignment'],
                )
                return redirect('character_sheet_list')
            if charactercreation_formset.is_valid():
                charactercreation_formset.save()
                return redirect('character_sheet_list')
            else:
                return render(request, 'roleapp/charactersheet_create.html',
                              context={'form': charactercreation_formset})
        return render(request, 'roleapp/charactersheet_create.html',
                               context={'form': charactercreation_formset})