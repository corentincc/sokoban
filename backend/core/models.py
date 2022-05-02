from django.db import models


class Level(models.Model):
    class Meta:
        db_table = "level"

    map = models.CharField(max_length=512, unique=True)

    def __str__(self) -> str:
        return f"Level {self.id or 'undefined'}"
