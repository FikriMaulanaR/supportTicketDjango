from django.contrib import messages
from django.shortcuts import render, redirect
from django.contrib.messages.views import SuccessMessageMixin
from django.contrib.auth.views import PasswordChangeView
from .forms import PasswordChangingForm,UserForm, ProfileForm
from django.urls import reverse_lazy
from django.contrib.auth.decorators import login_required

# Create your views here.
class PasswordsChangeView(SuccessMessageMixin, PasswordChangeView):
    form_class = PasswordChangingForm
    template_name = 'change-password.html'
    success_url = reverse_lazy('Dashboard')
    success_message = "Your Password Was Changed Successfully..."
    extra_context: dict = {'title':'Change Password'}

@login_required(login_url='login')
def update_profile(request):
    if request.method == 'POST':
        user_form = UserForm(request.POST, instance=request.user)
        profile_form = ProfileForm(request.POST, instance=request.user.profile)
        if user_form.is_valid() and profile_form.is_valid():
            user_form.save()
            profile_form.save()
            messages.success(request, ('Your Profile was successfully updated!'))
            return redirect('Dashboard')
        else:
            messages.warning(request, ('Please Correct the error below'))
            return redirect('profile')
    else:
        user_form = UserForm(instance=request.user)
        profile_form = ProfileForm(instance=request.user.profile)
    return render(request, 'profile.html', {
        'user_form':user_form,
        'profile_form':profile_form,
        'title':'Profile',
    })