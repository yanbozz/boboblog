from django.contrib import admin
from .models import ViewCount


@admin.register(ViewCount)
class ViewCountAdmin(admin.ModelAdmin):
    list_display = (
        'count',
        'content_type',
        'object_id',
    )
