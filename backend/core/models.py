from django.db import models
from django.db.models import Model


class Level(Model):
    class Meta:
        db_table = "level"

    map: str = models.CharField(max_length=512, unique=True)

    def __str__(self) -> str:
        return f"Level {self.id or 'undefined'}"
