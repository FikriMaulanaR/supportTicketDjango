from django.urls import path, include
from .views import PasswordsChangeView, update_profile
from django.contrib.auth.decorators import login_required

urlpatterns = [
    path('', update_profile, name='profile'),
    path('password/', PasswordsChangeView.as_view(), name='password'),
]
