import os

from dotenv import load_dotenv

from services.utils import trace


load_dotenv()

EXEC_PROFILE = os.getenv("EXEC_PROFILE", "dev")

match EXEC_PROFILE.lower():
    case "dev":
        from .dev import *  # noqa
    case "prod":
        from .prod import *  # noqa
    case "local":
        from .local import *  # noqa
    case _:
        raise RuntimeError("No suitable configuration found.")

trace.info(f'Profile set from "{EXEC_PROFILE.title()} Settings"')
