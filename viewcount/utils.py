import datetime
from django.utils import timezone
from django.contrib.contenttypes.models import ContentType
from django.db.models import Sum
from .models import ViewCount, ViewDetail
from blog.models import Post
# view record


def view_stats_once_viewed(request, response, obj):
    ct = ContentType.objects.get_for_model(obj)
    key = "%s_%s_viewed" % (ct.model, obj.pk)
    if not request.COOKIES.get(key):
        # total view increment by 1
        view_count, created = ViewCount.objects.get_or_create(content_type=ct, object_id=obj.pk)
        view_count.count += 1
        view_count.save()
        response.set_cookie(key, 'true')

        # daily view increment by 1
        date = timezone.now().date()
        view_detail, created = ViewDetail.objects.get_or_create(
            content_type=ct,
            object_id=obj.pk,
            date=date
        )
        view_detail.count += 1
        view_detail.save()
    return response


def get_week_view_data(content_type):  # view data for last seven days
    today = timezone.now().date()
    view_data = []
    dates = []
    for i in range(6, -1, -1):
        date = today - datetime.timedelta(days=i)
        dates.append(date.strftime('%m/%d'))
        view_detail = ViewDetail.objects.filter(
            content_type=content_type,
            date=date
        )
        result = view_detail.aggregate(view_count_sum=Sum('count'))
        view_data.append(result['view_count_sum'] or 0)

    return dates[:7], view_data[:7]


def get_today_hot_data(content_type):  # today's hot data query
    today = timezone.now().date()
    view_detail = ViewDetail.objects.filter(
        content_type=content_type, date=today).order_by('-count')
    return view_detail[:7]


def get_yesterday_hot_data(content_type):  # yesterday's hot data query
    yesterday = timezone.now().date() - datetime.timedelta(days=1)
    view_detail = ViewDetail.objects.filter(
        content_type=content_type, date=yesterday).order_by('-count')
    return view_detail[:7]


def get_week_hot_data(content_type):  # hot data query for past seven days
    today = timezone.now().date()
    date = today - datetime.timedelta(days=7)
    posts = Post.objects.filter(view_detail__date__lt=today, view_detail__date__gte=date,)
    view_detail = posts.values('id', 'title').annotate(
        view_count_sum=Sum('view_detail__count')).order_by('-view_count_sum')
    return view_detail[:7]
