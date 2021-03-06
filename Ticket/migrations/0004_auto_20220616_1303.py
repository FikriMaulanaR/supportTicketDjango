# Generated by Django 3.2.13 on 2022-06-16 06:03

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Ticket', '0003_auto_20220615_2044'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ticket',
            name='Description',
            field=models.CharField(help_text='Describe Your Question!', max_length=1000),
        ),
        migrations.AlterField(
            model_name='ticket',
            name='Level',
            field=models.CharField(choices=[('Low', 'Low'), ('Moderate', 'Moderate'), ('High', 'High')], default='Low', help_text='Question Difficulty Level', max_length=10),
        ),
        migrations.AlterField(
            model_name='ticket',
            name='Subject',
            field=models.CharField(help_text='Subject of The Question', max_length=100),
        ),
        migrations.AlterField(
            model_name='ticketcomment',
            name='ticket',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='comments', to='Ticket.ticket'),
        ),
    ]
