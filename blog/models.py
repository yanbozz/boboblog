from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from django.urls import reverse
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes.fields import GenericRelation
from django.template.defaultfilters import truncatechars
from ckeditor.fields import RichTextField
from comments.models import Comment
from viewcount.models import ViewCount, ViewCountExtension, ViewDetail


class Post(models.Model, ViewCountExtension):
    title = models.CharField(max_length=50)
    pub_date = models.DateTimeField(default=timezone.now)
    content = RichTextField()
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    view_count = GenericRelation(
        ViewCount,
        related_query_name='post',
        content_type_field='content_type',
        object_id_field='object_id'
    )
    view_detail = GenericRelation(
        ViewDetail,
        related_query_name='post',
        content_type_field='content_type',
        object_id_field='object_id',
    )

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse('post-detail', kwargs={'pk': self.pk})

    # get comment lists for this object
    @property
    def comments(self):
        qs = Comment.objects.filter_by_instance(self)
        return qs

    # get content_type for this post object
    @property
    def get_content_type(self):
        content_type = ContentType.objects.get_for_model(self.__class__)
        return content_type

    # display a shorted content for admin page
    @property
    def short_content(self):
        return truncatechars(self.content, 100)

    # get tag names for this post object
    @property
    def get_tag_names(self):
        tags = list(self.tags.values_list('tag_name', flat=True))
        return tags

    # get tag objects for this post
    @property
    def get_tag_qs(self):
        return self.tags.all()
