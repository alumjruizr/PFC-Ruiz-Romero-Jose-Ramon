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
from roleapp.forms import CharacterSheetForm
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


# class CharacterSheetUpdateView(LoginRequiredMixin, UpdateView):
#     model = CharacterSheet
#     form_class = CharacterSheetForm
#     success_url = reverse_lazy('character_sheet_list')


class CharacterSheetCreateView(View):

    def get(self, request):
        return render(request, 'roleapp/charactersheet_create.html', context={'form': CharacterSheetForm})

    def post(self, request):
        form = CharacterSheetForm(data=request.POST)
        if form.is_valid():
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
                charisma=form.cleaned_data['intelligence'],
                actualLevel=form.cleaned_data['actualLevel'],
                currentHitPoints=form.cleaned_data['currentHitPoints'],
                experiencePoints=0,
                alignment=form.cleaned_data['alignment'],

            )
            return redirect('character_sheet_list')
        else:
            return render(request, 'roleapp/charactersheet_create.html', context={'form': form})


# class CharacterSheetUpdateView(View):
#
#     def get(self, request, pk):
#         return render(request, charactersheet-detail-view, context={'form': CharacterSheetForm})
#
#     def post(self, request, pk):
#         form = CharacterSheetForm(data=request.POST)
#         if form.is_valid():
#             CharacterSheet.objects.create(
#                 user_id=self.request.user.id,
#                 name=form.cleaned_data['name'],
#                 characterClass=form.cleaned_data['characterClass'],
#                 race=form.cleaned_data['race'],
#                 strength=form.cleaned_data['strength'],
#                 dexterity=form.cleaned_data['dexterity'],
#                 constitution=form.cleaned_data['constitution'],
#                 wisdom=form.cleaned_data['wisdom'],
#                 intelligence=form.cleaned_data['intelligence'],
#                 charisma=form.cleaned_data['intelligence'],
#                 actualLevel=form.cleaned_data['actualLevel'],
#                 currentHitPoints=form.cleaned_data['currentHitPoints'],
#                 experiencePoints=0,
#                 alignment=form.cleaned_data['alignment'],
#
#             )
#             return redirect('character_sheet_list')
#         else:
#             return render(request, charactersheet-detail-view, context={'form': form})


def edit_charactersheet(request, pk):

    characterSheet = CharacterSheet.objects.get(id=pk)
    form = CharacterSheetForm(instance=characterSheet)

    if request.method == 'POST':
        form = CharacterSheetForm(request.POST, instance=characterSheet)
        if form.is_valid():
            characterSheet.user_id = self.request.user.id,
            characterSheet.name = form.cleaned_data['name'],
            characterSheet.characterClass = form.cleaned_data['characterClass'],
            characterSheet.race = form.cleaned_data['race'],
            characterSheet.strength = form.cleaned_data['strength'],
            characterSheet.dexterity = form.cleaned_data['dexterity'],
            characterSheet.constitution = form.cleaned_data['constitution'],
            characterSheet.wisdom = form.cleaned_data['wisdom'],
            characterSheet.intelligence = form.cleaned_data['intelligence'],
            characterSheet.charisma = form.cleaned_data['charisma'],
            characterSheet.actualLevel = form.cleaned_data['actualLevel'],
            characterSheet.currentHitPoints = form.cleaned_data['currentHitPoints'],
            characterSheet.experiencePoints = form.cleaned_data['experiencePoints'],
            characterSheet.alignment = form.cleaned_data['alignment'],
            form.save()
            return redirect('character_sheet_list')
    else:
        form = CharacterSheetForm()

    context = {
        'form': form
    }

    return render(request, 'roleapp/charactersheet_form.html', context)
