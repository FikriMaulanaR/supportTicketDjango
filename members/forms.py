from django import forms
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth.models import User
from .models import Profile

class PasswordChangingForm(PasswordChangeForm):
    old_password = forms.CharField(label='Old Password', widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    new_password1 = forms.CharField(label='New Password', widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    new_password2 = forms.CharField(label='Confirm Password', widget=forms.PasswordInput(attrs={'class': 'form-control'}))

    class Meta:
        model = User
        fields = ('old_password', 'new_password1', 'new_password2')

class UserForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['username','first_name', 'last_name', 'email']
        labels = {
            'username' : 'Username',
            'first_name' : 'First Name',
            'last_name' : 'Last Name',
            'email' : 'Email',
        }
        widgets = {
            'username' : forms.TextInput(attrs={'class': 'form-control col-md-5'},),
            'first_name' : forms.TextInput(attrs={'class': 'form-control col-md-5'}),
            'last_name' : forms.TextInput(attrs={'class': 'form-control col-md-5'}),
            'email' : forms.EmailInput(attrs={'class': 'form-control col-md-5'}),
        }

class ProfileForm(forms.ModelForm):
    class Meta:
        requireds = {
            'Birth' : False, 'Phone' : False, 'Address' : False
        }
        model = Profile
        fields = ['Birth', 'Phone', 'Address']
        labels = {
            'Birth' : 'Date of Birth', 'Phone' : 'Phone', 'Address' : 'Address'
        }
        exclude = ('user',)
        widgets = {
           'Birth':forms.DateInput(attrs={'class':'form-control col-md-5', 'type':'date'}),
           'Address':forms.Textarea(attrs={'class':'form-control col-md-5','rows':'3'}),
           'Phone':forms.NumberInput(attrs={'class':'form-control col-md-5','onkeypress':'return event.charCode >= 48'})
        }