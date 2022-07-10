# Generated by Django 3.2.13 on 2022-06-15 13:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Ticket', '0002_auto_20220614_1853'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ticket',
            name='Description',
            field=models.CharField(help_text='Describe your question', max_length=1000),
        ),
        migrations.AlterField(
            model_name='ticket',
            name='Subject',
            field=models.CharField(help_text='Subject of the question', max_length=100),
        ),
    ]
