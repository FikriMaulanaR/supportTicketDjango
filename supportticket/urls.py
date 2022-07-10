from django.contrib import admin
from django.urls import path, include
from .views import loginView, logoutView
from django.conf import settings
from django.conf.urls.static import static


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', loginView, name='login'),
    path('logout/', logoutView, name='logout'),
    path('Dashboard/', include('Ticket.urls')),
    path('members/', include('members.urls')),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)