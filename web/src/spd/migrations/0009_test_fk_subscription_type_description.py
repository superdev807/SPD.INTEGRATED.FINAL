# Generated by Django 2.0.7 on 2019-04-08 02:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('spd', '0008_test_subscription_type_description'),
    ]

    operations = [
        migrations.AddField(
            model_name='test_fk_subscription_type',
            name='Description',
            field=models.TextField(null=True),
        ),
    ]