from django.contrib import contenttypes
from django.shortcuts import render, HttpResponse, redirect
from django.http import HttpResponse, Http404
from django.contrib.auth import authenticate, login, logout

from django.views.generic.base import View
from roleapp.models import *
from django.contrib.auth.models import User


# Create your views here.
class LoginView(View):
    def get(self, request):
        return render(request, 'login.html')

    def post(self, request):
        user = authenticate(request, username=request.POST['username'], password=request.POST['password'])
        if user is not None:
            login(request, user)
            return HttpResponse(content=b'Success')
        return self.get(request)


class LogoutView(View):

    def get(self, request):
        if request.user.is_authenticated:
            logout(request)
        return redirect('login')
