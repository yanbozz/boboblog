from django.contrib import admin
from .models import PostTag

# Register your models here.
@admin.register(PostTag)
class PostTagAdmin(admin.ModelAdmin):
    list_display = [
        'slug',
        'tag_name',
    ]
