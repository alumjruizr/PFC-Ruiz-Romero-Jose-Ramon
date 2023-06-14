from django.contrib import contenttypes
from django.contrib.auth.views import PasswordChangeView
from django.shortcuts import render, HttpResponse, redirect
from django.http import HttpResponse, Http404
from django.contrib.auth import authenticate, login, logout
from django.urls import reverse_lazy
from django.views.generic import CreateView

from django.views.generic.base import View
from rest_framework.reverse import reverse_lazy
from roleapp.models import *
from django.contrib.auth.models import User
from users.forms import RegisterForm


# Create your views here.
class LoginView(View):
    def get(self, request):
        return render(request, 'registration/login.html')

    def post(self, request):
        user = authenticate(request, username=request.POST['username'], password=request.POST['password'])
        if user is not None:
            login(request, user)
            return HttpResponse(render(request, 'roleapp/charactersheet_list.html'))
        return self.get(request)


class LogoutView(View):

    def get(self, request):
        if request.user.is_authenticated:
            logout(request)
        return redirect('login')


class RegistrationView(View):
    form_class = RegisterForm
    template_name = 'registration.html'
    success_url = reverse_lazy('character_sheet_list')

def signup(request):
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data.get("username")
            password = form.cleaned_data.get("password1")
            form.save()
            newUser = authenticate(username=username, password=password)
            if newUser is not None:
                login(request, newUser)
                return redirect('character_sheet_list')

    form = RegisterForm()

    context = {
        'form': form
    }
    return render(request, 'registration.html', context)
