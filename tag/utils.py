from .models import PostTag

# get all tags for selection for post form


def get_tag_list():
    tag_list = PostTag.objects.all().values_list('slug', 'tag_name')
    return tag_list
