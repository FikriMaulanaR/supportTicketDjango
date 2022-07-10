from django import forms
from .models import Ticket, TicketComment
from django.contrib.auth.models import User

class DateInput(forms.DateInput):
    input_type = 'date'
    
    
class TicketForm(forms.ModelForm):
    class Meta:
        model = Ticket
        fields = '__all__'
        labels = {
            'Customer' : 'Creator',
            'Up_File':'Upload File (PDF, JPEG, JPG, and PNG format. Max. Size: 1MB)'
        }
        widgets = {
            'Customer' : forms.Select(attrs={'class': 'form-control','readonly':'readonly',}),
            'Subject' : forms.TextInput(attrs={'class': 'form-control col-md-7'}),
            'Description' : forms.Textarea(attrs={'class': 'form-control col-md-8','rows':'6'}),
            'Status' : forms.Select(attrs={'class': 'form-control col-md-3'}),
            'Level' : forms.Select(attrs={'class': 'form-control col-md-3'}),
        }


class TicketCommentForm(forms.ModelForm):
    class Meta:
        model = TicketComment
        fields = ('comment', 'Up_Doc',)
        labels = {
            'comment' : 'Comment/Response', 'Up_Doc':'Upload File (PDF, JPEG, JPG, and PNG format. Max. Size: 1MB)'
        }
        widgets = {
            'Up_Doc' : forms.FileInput(attrs={'class': 'form-control-file'}),
            'comment' : forms.Textarea(attrs={'class': 'md-textarea form-control', 'placeholder':'Response here ...', 'rows':'4'}),
        }
