import datetime
from django.utils import timezone
from django.contrib.contenttypes.models import ContentType
from django.db.models import Sum
from .models import ViewCount, ViewDetail


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


def get_week_view_data(content_type):
    today = timezone.now().date()
    view_data = []
    dates = []
    for i in range(7, 0, -1):
        date = today - datetime.timedelta(days=i)
        dates.append(date.strftime('%m/%d'))
        view_detail = ViewDetail.objects.filter(
            content_type=content_type,
            date=date
        )
        result = view_detail.aggregate(view_count_sum=Sum('count'))
        view_data.append(result['view_count_sum'] or 0)

    return dates, view_data
