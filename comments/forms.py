from django import forms
from .models import Comment


class CommentForm(forms.ModelForm):

    class Meta:
        model = Comment
        fields = ['content_type', 'object_id', 'content', 'parent', 'root']
        widgets = {
            'content_type': forms.HiddenInput,
            'object_id': forms.HiddenInput,
            'content': forms.Textarea(attrs={'placeholder': '说点什么吧...', 'class': '', 'rows': '2', 'maxlength': '500',
                                             }),
            'parent': forms.HiddenInput,
            'root': forms.HiddenInput,
        }

        labels = {
            'content': "",
        }
