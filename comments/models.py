from django.db import models
from django.conf import settings
from django.utils import timezone
from django.contrib.contenttypes.fields import GenericForeignKey
from django.contrib.contenttypes.models import ContentType
from django import forms
from django.contrib.auth.models import User


class CommentManager(models.Manager):
    def all():
        qs = super(CommentManager, self).filter(parent=None)
        return qs

    def filter_by_instance(self, instance):
        obj_id = instance.id
        content_type = ContentType.objects.get_for_model(instance.__class__)
        qs = super(CommentManager, self).filter(
            content_type=content_type, object_id=obj_id).filter(parent=None)
        return qs


class Comment(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE)
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type', 'object_id')
    parent = models.ForeignKey("self", null=True, blank=True, on_delete=models.CASCADE)
    root = models.ForeignKey("self", related_name='root_comment', null=True,
                             blank=True, on_delete=models.CASCADE)
    created = models.DateTimeField(default=timezone.now)
    content = models.TextField()
    objects = CommentManager()

    class Meta:
        ordering = ['-created']

    def __str__(self):
        return self.content

    def replies(self):  # replies
        return Comment.objects.filter(parent=self)

    def children(self):
        return Comment.objects.filter(root=self)

    def is_parent(self):
        if self.parent is not None:
            return False
        return True
