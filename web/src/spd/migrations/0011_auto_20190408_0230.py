# Generated by Django 2.0.7 on 2019-04-08 02:30

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('spd', '0010_auto_20190408_0228'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='subscription_options_access',
            name='display_name',
        ),
        migrations.RemoveField(
            model_name='subscription_options_cost',
            name='description',
        ),
        migrations.RemoveField(
            model_name='subscription_options_duration',
            name='description',
        ),
        migrations.RemoveField(
            model_name='subscription_options_records',
            name='description',
        ),
        migrations.RemoveField(
            model_name='subscription_options_renewable',
            name='description',
        ),
        migrations.RemoveField(
            model_name='subscription_options_trial',
            name='description',
        ),
        migrations.RemoveField(
            model_name='subscription_options_user_type',
            name='description',
        ),
    ]
