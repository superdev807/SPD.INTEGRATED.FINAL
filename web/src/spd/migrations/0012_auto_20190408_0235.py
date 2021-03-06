# Generated by Django 2.0.7 on 2019-04-08 02:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('spd', '0011_auto_20190408_0230'),
    ]

    operations = [
        migrations.RenameField(
            model_name='subscription_options_cost',
            old_name='display_name',
            new_name='display',
        ),
        migrations.RenameField(
            model_name='subscription_options_duration',
            old_name='display_name',
            new_name='display',
        ),
        migrations.RenameField(
            model_name='subscription_options_records',
            old_name='display_name',
            new_name='display',
        ),
        migrations.RenameField(
            model_name='subscription_options_renewable',
            old_name='display_name',
            new_name='display',
        ),
        migrations.RenameField(
            model_name='subscription_options_trial',
            old_name='display_name',
            new_name='display',
        ),
        migrations.RenameField(
            model_name='subscription_options_user_type',
            old_name='display_name',
            new_name='display',
        ),
        migrations.RemoveField(
            model_name='subscription_options_access',
            name='description',
        ),
        migrations.AddField(
            model_name='subscription_options_access',
            name='display',
            field=models.CharField(max_length=120, null=True),
        ),
    ]
