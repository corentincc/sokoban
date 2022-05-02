from dataclasses import dataclass

from asgiref.sync import sync_to_async
from django.core.exceptions import ObjectDoesNotExist

from core import models


@dataclass(slots=True)
class Level:
    map: str

    @classmethod
    def from_model(cls, instance: models.Level):
        return cls(instance.map)

    @classmethod
    async def get(cls, level_id: int):
        try:
            level = await sync_to_async(models.Level.objects.get)(pk=level_id)
        except ObjectDoesNotExist:
            return

        return cls.from_model(level)
