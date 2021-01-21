
from django.shortcuts import render
from django.views.generic.base import TemplateView
from django.contrib.contenttypes.models import ContentType
from django.core.cache import cache
from blog.models import Post
from .models import ViewCount, ViewDetail
from .utils import (
    get_week_view_data,
    get_today_hot_data,
    get_yesterday_hot_data,
    get_week_hot_data,
)


class ViewDataView(TemplateView):
    template_name = 'viewcount/view_data.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        post_content_type = ContentType.objects.get_for_model(Post)
        dates, view_data = get_week_view_data(post_content_type)

        # fetch cached data for hot posts
        week_hot_data = cache.get('week_hot_data')
        if week_hot_data is None:
            week_hot_data = get_week_hot_data(post_content_type)
            cache.set('week_hot_data', week_hot_data, 3600)
        context['dates'] = dates
        context['view_data'] = view_data
        context['today_hot_data'] = get_today_hot_data(post_content_type)
        context['yesterday_hot_data'] = get_yesterday_hot_data(post_content_type)
        context['week_hot_data'] = week_hot_data
        return context
