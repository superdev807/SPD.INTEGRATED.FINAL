# Generated by Django 2.0.7 on 2019-04-08 02:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('spd', '0005_subscription_options_duration_calendar_days'),
    ]

    operations = [
        migrations.AlterField(
            model_name='subscription_options_duration',
            name='calendar_days',
            field=models.IntegerField(help_text='How Many Calendar Days Does The Subscription Run For?', null=True),
        ),
    ]
