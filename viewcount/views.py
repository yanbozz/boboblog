
from django.shortcuts import render
from django.views.generic.base import TemplateView
from django.contrib.contenttypes.models import ContentType
from blog.models import Post
from .models import ViewCount, ViewDetail
from .utils import get_week_view_data


class ViewDataView(TemplateView):
    template_name = 'viewcount/view_data.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        post_content_type = ContentType.objects.get_for_model(Post)
        dates, view_data = get_week_view_data(post_content_type)
        context['view_data'] = view_data
        context['dates'] = dates
        return context
