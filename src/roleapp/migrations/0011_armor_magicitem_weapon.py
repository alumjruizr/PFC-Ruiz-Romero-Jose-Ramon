# Generated by Django 3.2.10 on 2023-05-31 17:55

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('roleapp', '0010_auto_20230531_1955'),
    ]

    operations = [
        migrations.CreateModel(
            name='Armor',
            fields=[
                ('item_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='roleapp.item')),
                ('armorClass', models.IntegerField()),
                ('dexterityMod', models.IntegerField()),
            ],
            bases=('roleapp.item',),
        ),
        migrations.CreateModel(
            name='MagicItem',
            fields=[
                ('item_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='roleapp.item')),
                ('rarity', models.CharField(choices=[('Common', 'Common'), ('Uncommon', 'Uncommon'), ('Rare', 'Rare'), ('Very rare', 'Very rare'), ('Legendary', 'Legendary'), ('Artifact', 'Artifact'), ('Unknown', 'Unknown')], default='Common', max_length=20)),
            ],
            bases=('roleapp.item',),
        ),
        migrations.CreateModel(
            name='Weapon',
            fields=[
                ('item_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='roleapp.item')),
                ('dice', models.CharField(max_length=4)),
            ],
            bases=('roleapp.item',),
        ),
    ]