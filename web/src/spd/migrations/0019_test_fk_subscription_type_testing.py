# Generated by Django 2.0.7 on 2019-04-08 03:15

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('spd', '0018_test_fk_subscription_type_assigned_name'),
    ]

    operations = [
        migrations.AddField(
            model_name='test_fk_subscription_type',
            name='Testing',
            field=models.BooleanField(default=False),
        ),
    ]
