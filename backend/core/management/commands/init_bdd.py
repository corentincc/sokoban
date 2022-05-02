from django.core.management import BaseCommand, call_command

from services.utils import trace


class Command(BaseCommand):
    help = "Initialize BDD"

    def handle(self, *args, **options):
        trace.info("Reset database")
        call_command("reset_db", "--noinput", "-c")
        trace.info("Reset successful")

        trace.info("Apply migrations")
        call_command("migrate", interactive=False)
