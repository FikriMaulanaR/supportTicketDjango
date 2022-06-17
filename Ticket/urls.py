from django.urls import path, include
from .views import TicketDeleteView, all_tickets, delete_comment, open_tickets, create_ticket, dashboard, TicketDetailView, update_ticket

urlpatterns = [
    path('', dashboard, name='Dashboard'),
    path('detail-ticket/<int:pk>', TicketDetailView.as_view(), name='detail-ticket'),
    path('create-ticket/', create_ticket, name='create-ticket'),
    path('update-ticket/<int:pk>', update_ticket, name='update-ticket'),
    path('<int:pk>/delete-ticket/', TicketDeleteView.as_view(), name='delete-ticket'),
    path('all-tickets/', all_tickets, name='all-tickets'),
    path('open-tickets/', open_tickets, name='open-tickets'),
    path('detail-ticket/<int:pk>/delete-comment/<int:id>', delete_comment, name='delete-comment'),
]
