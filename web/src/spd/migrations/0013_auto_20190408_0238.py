# Generated by Django 2.0.7 on 2019-04-08 02:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('spd', '0012_auto_20190408_0235'),
    ]

    operations = [
        migrations.AddField(
            model_name='subscription_options_records',
            name='records',
            field=models.IntegerField(null=True),
        ),
        migrations.AlterField(
            model_name='subscription_options_records',
            name='display',
            field=models.IntegerField(null=True),
        ),
    ]
