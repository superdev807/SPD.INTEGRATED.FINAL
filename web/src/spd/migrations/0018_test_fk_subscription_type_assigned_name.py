# Generated by Django 2.0.7 on 2019-04-08 02:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('spd', '0017_subscription_options_cost_cost'),
    ]

    operations = [
        migrations.AddField(
            model_name='test_fk_subscription_type',
            name='assigned_name',
            field=models.CharField(max_length=100, null=True),
        ),
    ]