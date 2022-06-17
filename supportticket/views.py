from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required


def loginView(request):
    context = {
        'page_title':'LOGIN',
    }
    user = None

    if request.method == "GET":
        if request.user.is_authenticated:
            return redirect('Dashboard')
        else:   
            return render(request, 'login.html', context)


    if request.method == "POST":
        print(request.POST)
        username_login = request.POST['username']
        password_login = request.POST['password']

        user = authenticate(request, username=username_login, password=password_login)
        
        if user is not None:
            login(request, user)
            return redirect('Dashboard')
        else:
            messages.warning(request, ("There Was An Error Logging In, Try Again..."))
            return redirect('login')

@login_required(login_url='')
def logoutView(request):
    logout(request)
    return redirect('login')