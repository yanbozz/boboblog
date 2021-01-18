from django.apps import AppConfig


class ViewcountConfig(AppConfig):
    name = 'viewcount'

    def ready(self):
        import viewcount.signals
