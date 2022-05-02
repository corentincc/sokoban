# Generated by Django 4.0.4 on 2022-05-05 02:17

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name="Level",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("map", models.CharField(max_length=512, unique=True)),
            ],
            options={
                "db_table": "level",
            },
        ),
    ]
