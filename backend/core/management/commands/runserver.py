import inspect
from typing import Any

import uvicorn
from django.core.management import CommandParser
from django.core.management.commands.runserver import Command as BaseRunServerCommand


class Command(BaseRunServerCommand):
    default_host: str = "127.0.0.1"
    default_port: int = 8000

    def add_arguments(self, parser: CommandParser):
        parser.add_argument(
            "--ssl-certfile",
            help="ssl certfile",
            dest="ssl_certfile",
        )
        parser.add_argument(
            "--ssl-keyfile",
            help="ssl keyfile",
            dest="ssl_keyfile",
        )
        parser.add_argument(
            "--proxy-headers",
            action="store_true",
            help="proxy headers",
            dest="proxy_headers",
        )
        parser.add_argument(
            "--forwarded-allow-ips",
            help="forwarded allow ips",
            dest="forwarded_allow_ips",
        )
        parser.add_argument(
            "--host",
            default=self.default_host,
            help="change host",
            dest="host",
        )
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
