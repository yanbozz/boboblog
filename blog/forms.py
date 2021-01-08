from django import forms

from .models import Post


class PostCreateForm(forms.ModelForm):
    class Meta:
        model = Post
        fields = ['title', 'content']
        widgets = {
            'title': forms.TextInput(),
            'content': forms.Textarea(),
        }

        labels = {
            'title': "标题",
            'content': "内容",
        }
