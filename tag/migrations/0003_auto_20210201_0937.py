# Generated by Django 2.2.2 on 2021-02-01 01:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tag', '0002_auto_20210128_1101'),
    ]

    operations = [
        migrations.AlterField(
            model_name='posttag',
            name='posts',
            field=models.ManyToManyField(blank=True, related_name='tags', related_query_name='tag', to='blog.Post'),
        ),
    ]
