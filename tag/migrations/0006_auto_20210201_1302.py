# Generated by Django 2.2.2 on 2021-02-01 05:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tag', '0005_posttag_slug'),
    ]

    operations = [
        migrations.AlterField(
            model_name='posttag',
            name='slug',
            field=models.SlugField(),
        ),
    ]