from blacksheep import pretty_json, not_found, Response
from blacksheep.server.controllers import ApiController, get

from core.schemas import Level


class SokobanController(ApiController):
    @classmethod
    def class_name(cls) -> str:
        return "Sokoban Controller"

    @classmethod
    def route(cls) -> str:
        return "api"

    @get("/level/:level_id")
    async def level(self, level_id: int) -> Response:
        if level := await Level.get(level_id):
            return pretty_json({"map": level.map})
        else:
            return not_found()
