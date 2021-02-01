from django.utils import timezone
from django.db import models
from blog.models import Post
from uuslug import slugify


class PostTagManager(models.Manager):

    def get_tags_for_post(self, instance):
        qs = PostTag.objects.filter(posts=instance)
        return qs

    def add_post_to_tag(self, instance, tag_list):
        qs = PostTag.objects.filter(slug__in=tag_list)
        for tag in qs:
            tag.posts.add(instance)


class PostTag(models.Model):
    slug = models.SlugField(max_length=50)
    tag_name = models.CharField(max_length=50)
    created = models.DateTimeField(default=timezone.now)
    posts = models.ManyToManyField(Post, blank=True,
                                   related_name='tags', related_query_name='tag')
    objects = PostTagManager()

    def get_absolute_url(self):
        return reverse('posts-with-tag', kwargs={'slug': self.slug})

    def __str__(self):
        return self.tag_name

    def __unicode__(self):
        return self.tag_name

    def get_posts(self):
        return Post.objects.filter(tag=self)

    # slugify chinese into pinyin
    def save(self, *args, **kwargs):
        self.slug = slugify(self.tag_name)
        super(PostTag, self).save(*args, **kwargs)
