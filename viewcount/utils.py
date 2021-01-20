from django.contrib.contenttypes.models import ContentType
from .models import ViewCount


def view_stats_once_view(request, response, obj):
    ct = ContentType.objects.get_for_model(obj)
    key = "%s_%s_viewed" % (ct.model, obj.pk)
    if not request.COOKIES.get(key):
        # create and increment by 1
        view_count = ViewCount.objects.filter(content_type=ct, object_id=obj.pk).first()
        if not view_count:
            view_count = ViewCount.objects.create(
                content_type=ct,
                object_id=obj.pk
            )
        view_count.count += 1
        view_count.save()
        response.set_cookie(key, 'true')
    return response
