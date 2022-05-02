import inspect
from typing import Any

import uvicorn
from django.core.management import CommandParser
from django.core.management.commands.runserver import Command as BaseRunServerCommand


class Command(BaseRunServerCommand):
    default_port: int = 8000

    def add_arguments(self, parser: CommandParser):
        parser.add_argument(
            "-p",
            "--port",
            default=self.default_port,
            type=int,
            help="change port",
            dest="port",
        )
        parser.add_argument(
            "-r",
            "--reload",
            action="store_true",
            help="auto reload on change",
            dest="reload",
        )

    def handle(self, *args, **options):
        uvicorn_options = self.parse_uvicorn_options(**options)
        uvicorn.run("core.asgi:application", **uvicorn_options)

    @staticmethod
    def parse_uvicorn_options(**options) -> dict[str, Any]:
        signature = inspect.signature(uvicorn.Config)
        keys = [
            parameter.name
            for parameter in signature.parameters.values()
            if parameter.kind == parameter.POSITIONAL_OR_KEYWORD
        ]
        return {key: value for key in keys if (value := options.get(key)) is not None}
