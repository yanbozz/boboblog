from django.db import models
from django.utils import timezone
from django.db.models.fields import exceptions
from django.contrib.contenttypes.fields import GenericForeignKey
from django.contrib.contenttypes.models import ContentType


class ViewCount(models.Model):
    count = models.IntegerField(default=0)
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE)
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type', 'object_id')

    def __str__(self):
        return str(self.count)


class ViewDetail(models.Model):
    date = models.DateField(default=timezone.now)
    count = models.IntegerField(default=0)
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE)
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type', 'object_id')


class ViewCountExtension():
    def get_view_count(self):
        try:
            view_count = self.view_count.first()
            return view_count.count
        except exceptions.ObjectDoesNotExist:
            return 0
