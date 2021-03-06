import os
from pathlib import Path

from openapidocs.v3 import Info

from services.utils import key_service


# API
APP_NAME = os.getenv("APP_NAME", "Sokoban")
APP_VERSION = os.getenv("APP_VERSION", "1.0")
APP_INFO = Info(title=APP_NAME, version=APP_VERSION)

API_KEY = os.getenv("API_KEY", key_service.get_or_create_api_key())

DEBUG = False

# Django ORM
BASE_DIR = Path(__file__).parent.parent

INSTALLED_APPS = ("django_extensions", "core")

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.postgresql",
        "NAME": os.getenv("DB_NAME", "sokoban"),
        "USER": os.getenv("DB_USER", "root"),
        "PASSWORD": os.getenv("DB_PASSWORD", "root"),
        "HOST": os.getenv("DB_HOST", "localhost"),
        "PORT": os.getenv("DB_PORT", 5432),
    }
}

DEFAULT_AUTO_FIELD = "django.db.models.BigAutoField"

SECRET_KEY = key_service.get_or_create_secret_key()
