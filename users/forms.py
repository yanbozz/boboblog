from django import forms
from .models import Profile
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.forms import AuthenticationForm, UsernameField


class CustomAuthenticationForm(AuthenticationForm):
    username = UsernameField(
        label='用户名',
    )

    password = forms.CharField(label='密码', widget=forms.PasswordInput)


class UserSignupForm(UserCreationForm):
    email = forms.EmailField(label="邮箱")
    password1 = forms.CharField(label='密码', widget=forms.PasswordInput)
    password2 = forms.CharField(label='确认密码', widget=forms.PasswordInput)

    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']
        labels = {
            'username': '用户名',
        }
        help_texts = {
            'username': ''
        }


class UserUpdateForm(forms.ModelForm):
    email = forms.EmailField(label="邮箱")

    class Meta:
        model = User
        fields = ['username', 'email']
        labels = {
            'username': '用户名',
        }
        help_texts = {
            'username': ''
        }


class ProfileUpdateForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = ['profile_pic']
        labels = {
            'profile_pic': '头像图片'
        }
