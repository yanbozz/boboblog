from django import forms
from .models import Post
from tag.models import PostTag
from tag.utils import get_tag_list


class PostCreateForm(forms.ModelForm):
    tags = forms.MultipleChoiceField(choices=get_tag_list(), label="标签", )

    class Meta:
        model = Post
        fields = ['title', 'content']
        widgets = {
            'title': forms.TextInput(attrs={'style': 'width:100%'}),

        }

        labels = {
            'title': "标题",
            'content': "内容",
        }
