from django import forms
from django.contrib import admin
from ckeditor.widgets import CKEditorWidget
from .models import Post


@admin.register(Post)
class PostAdmin(admin.ModelAdmin):
    list_display = (
        'title',
        'pub_date',
        'pk',
        'short_content',
        'author',
        'get_view_count',
        'get_tag_names',
    )
