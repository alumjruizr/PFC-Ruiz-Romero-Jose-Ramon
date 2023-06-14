from crispy_forms.bootstrap import FormActions
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Submit, Button, Layout, HTML, Fieldset
from django import forms
from django.contrib.auth.models import User
from django.urls import reverse, reverse_lazy
from roleapp.models import CharacterSheet, Race, CharacterClass


class CharacterSheetForm(forms.ModelForm):
    class Meta:
        model = CharacterSheet
        fields = {}

    name = forms.CharField(required=True)
    strength = forms.IntegerField(required=True)
    dexterity = forms.IntegerField(required=True)
    constitution = forms.IntegerField(required=True)
    wisdom = forms.IntegerField(required=True)
    intelligence = forms.IntegerField(required=True)
    charisma = forms.IntegerField(required=True)
    actualLevel = forms.IntegerField(required=True, min_value=1, max_value=20)
    characterClass = forms.ModelChoiceField(queryset=CharacterClass.objects.all())
    race = forms.ModelChoiceField(queryset=Race.objects.all())
    alignment = forms.CharField()
    currentHitPoints = forms.IntegerField()
    experiencePoints = forms.IntegerField()
