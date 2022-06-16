from dataclasses import dataclass

from django.core.exceptions import ObjectDoesNotExist

from core import models


@dataclass(slots=True)
class Level:
    map: str

    @classmethod
    def from_model(cls, instance: models.Level):
        return cls(instance.map)

    @classmethod
    def get(cls, level_id: int):
        try:
            level = models.Level.objects.get(pk=level_id)
        except ObjectDoesNotExist:
            return

        return cls.from_model(level)
