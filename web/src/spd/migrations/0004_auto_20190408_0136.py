# Generated by Django 2.0.7 on 2019-04-08 01:36

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('spd', '0003_subscription_options_access_subscription_options_cost_subscription_options_duration_subscription_opt'),
    ]

    operations = [
        migrations.CreateModel(
            name='test_fk_subscription_type',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Access', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='spd.Subscription_Options_Access')),
                ('Cost', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='spd.Subscription_Options_Cost')),
                ('Duration', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='spd.Subscription_Options_Duration')),
                ('Records', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='spd.Subscription_Options_Records')),
                ('Renewable', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='spd.Subscription_Options_Renewable')),
                ('Trial', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='spd.Subscription_Options_Trial')),
            ],
        ),
        migrations.AddField(
            model_name='subscription_options_user_type',
            name='max_users',
            field=models.IntegerField(default=1),
        ),
        migrations.AddField(
            model_name='test_fk_subscription_type',
            name='User_Type',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='spd.Subscription_Options_User_Type'),
        ),
    ]