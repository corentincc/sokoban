from blacksheep import Application
from blacksheep.server.openapi.v3 import OpenAPIHandler
from blacksheep.server.authorization import Policy
from django.conf import settings
from guardpost.common import AuthenticatedRequirement

from api.authentication import ApiKeyAuthHandler


application = Application(show_error_details=settings.DEBUG)

swagger = OpenAPIHandler(
    info=settings.APP_INFO,
    anonymous_access=settings.DEBUG,
    ui_path="/",
)
swagger.bind_app(application)

authentication = application.use_authentication()
authentication.add(ApiKeyAuthHandler())

authorization = application.use_authorization()
authorization.default_policy = Policy("authenticated", AuthenticatedRequirement())


@application.on_start
async def import_controllers(_):
    from api import controllers  # noqa
