from django.contrib.auth.views import PasswordResetView
from .forms import UserSignupForm
from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.contrib import messages
from django.contrib.auth.views import LoginView
from django.views.generic.edit import(
    CreateView,
    UpdateView,
)


from django.contrib.auth.mixins import (
    LoginRequiredMixin,
    UserPassesTestMixin,
)

from .forms import (
    UserUpdateForm,
    ProfileUpdateForm,
    CustomAuthenticationForm
)


class CustomLoginView(LoginView):
    authentication_form = CustomAuthenticationForm


class UserSignupView(CreateView):
    template_name = "users/signup.html"
    form_class = UserSignupForm
    success_url = '/login/'

    def form_valid(self, form):
        messages.success(self.request, f"注册成功!欢迎来到我的博客.")
        return super().form_valid(form)


class ProfileUpdateView(UpdateView, LoginRequiredMixin, UserPassesTestMixin):
    template_name = 'users/profile.html'

    def post(self, request, *args, **kwargs):
        u_form = UserUpdateForm(request.POST, instance=request.user)
        p_form = ProfileUpdateForm(request.POST, request.FILES, instance=request.user.profile)
        context = {
            'u_form': u_form,
            'p_form': p_form,
        }
        if u_form.is_valid() and p_form.is_valid():
            u_form.save()
            p_form.save()
            messages.success(self.request, f"个人信息修改成功!")
            return redirect('profile')
        return render(request, self.template_name, context=context)

    def get(self, request, *args, **kwargs):
        u_form = UserUpdateForm(instance=request.user)
        p_form = ProfileUpdateForm(instance=request.user.profile)
        context = {
            'u_form': u_form,
            'p_form': p_form,
        }
        return render(request, self.template_name, context=context)


class PasswordResetView(PasswordResetView):
    email_template_name = 'users/password_reset_email.html'
    subject_template_name = 'users/password_reset_subject.txt'
