from django.db import models
from django.contrib.auth.models import User
from .validators import validate_file_size, validate_file_extension, validate_file_extension1

# Create your models here.
class Ticket(models.Model):
    Customer = models.ForeignKey(User, on_delete=models.CASCADE, blank=True, null=True)
    Subject = models.CharField(max_length=100, help_text='Subject of The Question')
    Description = models.CharField(max_length=1000, help_text='Describe Your Question!')
    Up_File = models.FileField(upload_to='dokumen/', verbose_name="", validators=[validate_file_size,validate_file_extension1], null=True, blank=True, help_text='This field is not required')
    Created_at = models.DateTimeField(auto_now_add=True)
    Last_update = models.DateTimeField(auto_now=True)
    
    STATUS = (
        ('Open', 'Open'),
        ('Close', 'Close'),
    )
    Status = models.CharField(max_length=10, choices=STATUS, default='Open', blank=True, null=True)

    LEVEL = (
        ('Low', 'Low'),
        ('Moderate', 'Moderate'),
        ('High', 'High'),
    )
    Level = models.CharField(max_length=10, choices=LEVEL, default='Low', help_text='Question Difficulty Level')

    def __str__(self):
        return str(self.Customer) + ' | ' + self.Subject

class TicketComment(models.Model):
    ticket = models.ForeignKey(Ticket, related_name="comments", on_delete=models.CASCADE)
    date = models.DateTimeField(auto_now_add=True)
    admin = models.ForeignKey(User, on_delete=models.CASCADE)
    comment = models.CharField(max_length=1000)
    Up_Doc = models.FileField(upload_to='dokumen/comment/', verbose_name="", validators=[validate_file_size,validate_file_extension], null=True, blank=True)

    def _str_(self):
        return str(self.ticket) + ' | ' + self.comment + ' | ' + str(self.admin)