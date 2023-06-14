from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from django.forms import PasswordInput


class RegisterForm(UserCreationForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields["username"].widget.attrs.update({
            'type': 'text',
            'class': 'form-control',
            'placeholder': 'Your username',
            'id': 'username',
            'name': 'username'
        })
        self.fields["password1"].widget.attrs.update({
            'type': 'password',
            'class': 'form-control',
            'placeholder': 'Your password',
            'id': 'password',
            'name': 'password'
        })
        self.fields["password2"].widget.attrs.update({
            'type': 'password',
            'class': 'form-control',
            'placeholder': 'Confirm password',
            'id': 'password2',
            'name': 'password2'
        })

    class Meta:
        model = User
        fields = ["username", "password1", "password2"]
