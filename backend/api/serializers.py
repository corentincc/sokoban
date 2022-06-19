from dataclasses import dataclass

from core import models


@dataclass(slots=True)
class LevelSerializer:
    map: str

    @classmethod
    def from_model(cls, instance: models.Level):
        return cls(instance.map)
