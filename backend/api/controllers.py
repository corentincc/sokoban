from blacksheep import pretty_json, no_content, Response
from blacksheep.server.controllers import ApiController, get

from .schemas import Level


class SokobanController(ApiController):
    @classmethod
    def class_name(cls) -> str:
        return "Sokoban Controller"

    @classmethod
    def route(cls) -> str:
        return "api"

    @get("/level/:level_id")
    def level(self, level_id: int) -> Response:
        if level := Level.get(level_id):
            return pretty_json({"map": level.map})
        else:
            return no_content()
