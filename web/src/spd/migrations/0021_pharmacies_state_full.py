# Generated by Django 2.0.7 on 2019-04-08 05:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('spd', '0020_auto_20190408_0338'),
    ]

    operations = [
        migrations.AddField(
            model_name='pharmacies',
            name='State_full',
            field=models.CharField(default='derp_state_full', max_length=50),
            preserve_default=False,
        ),
    ]