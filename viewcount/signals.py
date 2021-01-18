from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import ViewCount
from blog.models import Post


@receiver(post_save, sender=Post)
def create_profile(sender, instance, created, **kwargs):
    if created:
        view_count = ViewCount.objects.create(
            content_type=instance.get_content_type, object_id=instance.pk)
        view_count.save()
