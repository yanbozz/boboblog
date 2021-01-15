from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from django.urls import reverse
from django.contrib.contenttypes.models import ContentType
from ckeditor.fields import RichTextField
from comments.models import Comment


class Post(models.Model):
    title = models.CharField(max_length=50)
    pub_date = models.DateTimeField(default=timezone.now)
    content = RichTextField()
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    view_count = models.IntegerField(default=0)

    def __str__(self):
        return self.title

    def get_absolute_url(self):
        return reverse('post-detail', kwargs={'pk': self.pk})

    @property
    def comments(self):
        qs = Comment.objects.filter_by_instance(self)
        return qs

    @property
    def get_content_type(self):
        content_type = ContentType.objects.get_for_model(self.__class__)
        return content_type
