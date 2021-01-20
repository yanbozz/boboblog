from django.contrib import admin
from .models import ViewCount, ViewDetail


@admin.register(ViewCount)
class ViewCountAdmin(admin.ModelAdmin):
    list_display = (
        'count',
        'content_object',
    )


@admin.register(ViewDetail)
class ViewDetailAdmin(admin.ModelAdmin):
    list_display = (
        'date',
        'count',
        'content_object',

    )
