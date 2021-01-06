from django import forms
from .models import Comment


class CommentForm(forms.ModelForm):
    parent_id = forms.IntegerField(widget=forms.HiddenInput, required=False)
    root_id = forms.IntegerField(widget=forms.HiddenInput, required=False)

    class Meta:
        model = Comment
        fields = ['content_type', 'object_id', 'content']
        widgets = {
            'content_type': forms.HiddenInput,
            'object_id': forms.HiddenInput,
            'content': forms.Textarea(attrs={'placeholder': '说点什么吧...', 'wrap': 'hard',  'rows': '2', 'data-min-rows': '2', 'class': 'autoExpand', 'maxlength': '500',
                                             }),
        }

        labels = {
            'content': "",
        }
