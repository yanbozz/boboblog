from django.utils import timezone
from django.db import models
from blog.models import Post


class PostTag(models.Model):
    tag_name = models.SlugField()
    created = models.DateTimeField(default=timezone.now)
    posts = models.ManyToManyField(Post, blank=False, related_name='tags', related_query_name='tag')

    def __str__(self):
        return self.tag_name

    def get_posts(self):
        return Post.objects.filter(tag=self)
