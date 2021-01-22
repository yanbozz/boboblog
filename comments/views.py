from django.shortcuts import redirect, reverse, redirect
from django.contrib import messages
from django.http import HttpResponse, HttpResponseRedirect
from django.views.generic.edit import CreateView
from .forms import CommentForm
from django.contrib.contenttypes.models import ContentType
from .models import Comment
from blog.models import Post


class CommentPostView(CreateView):
    template_name = "comments/comment_list.html"
    form_class = CommentForm
    model = Comment

    def get_success_url(self):
        return reverse('post-detail', kwargs={'pk': self.kwargs['pk']})

    def get(self, request, *args, **kwargs):
        return redirect('post-detail', self.kwargs['pk'])

    def form_valid(self, form):
        user = self.request.user
        if not user.is_authenticated:
            messages.info(self.request, f"请先登录你的账号.")
            return redirect('/login/?next=%s' % self.request.path)
        post = Post.objects.get(pk=self.kwargs['pk'])
        form.save(False)
        form.instance.parent = None
        form.instance.root = None
        form.instance.user = user
        if form.cleaned_data['parent_id']:
            parent = Comment.objects.get(pk=form.cleaned_data['parent_id'])
            root = parent.root if parent.root else parent
            form.instance.parent = parent
            form.instance.root = root
        form.save(True)
        messages.success(self.request, f"评论发布成功.")
        # response_data = {}
        # response_data['result'] = 'Create comment successful!'
        # response_data['comment_id'] = form.instance.id
        # response_data['content'] = form.instance.content
        # response_data['created'] = form.instance.created.strftime('%Y-%m-%d')
        # response_data['user'] = form.instance.user.username
        return super().form_valid(form)
