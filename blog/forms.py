from django import forms

from .models import Post


class PostCreateForm(forms.ModelForm):
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
