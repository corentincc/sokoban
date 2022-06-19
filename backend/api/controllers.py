from typing import Any

from blacksheep import FromJSON, Response, bad_request, created, not_found, ok
from blacksheep.server.controllers import ApiController, delete, get, put
from django.core.exceptions import ObjectDoesNotExist

from core.models import Level
from .serializers import LevelSerializer


class SokobanController(ApiController):
    @classmethod
    def class_name(cls) -> str:
        return "Sokoban Controller"

    @classmethod
    def route(cls) -> str:
        return "api"

    @get("/levels")
    def levels(self):
        levels = Level.objects.all()
        return [LevelSerializer.from_model(level) for level in levels]

    @get("/level/:level_id")
    def level(self, level_id: int):
        try:
            level = Level.objects.get(pk=level_id)
            return LevelSerializer.from_model(level)
        except ObjectDoesNotExist:
            return not_found()

    @put("/level/create")
    def create_level(self, data: FromJSON) -> Response:
        values: dict[str, Any] = data.value

        try:
            level = Level.objects.create(**values)
            level.save()
        except TypeError as exc:
            return bad_request(str(exc))

        return created()

    @put("/level/edit/:level_id")
    def edit_level(self, level_id: int, data: FromJSON) -> Response:
        try:
            level = Level.objects.get(pk=level_id)
        except ObjectDoesNotExist:
            return not_found()

        values: dict[str, Any] = data.value

        for key, value in values.items():
            if not hasattr(level, key):
                return bad_request(f"Level doesn't have attribute '{key}'.")

            setattr(level, key, value)

        level.save()
        return ok()

    @delete("/level/delete/:level_id")
    def delete_level(self, level_id: int):
        try:
            level = Level.objects.get(pk=level_id)
        except ObjectDoesNotExist:
            return not_found()

        level.delete()
        return ok()
