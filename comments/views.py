import json
from django.shortcuts import redirect, reverse, redirect
from django.contrib import messages
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from django.views.generic.edit import CreateView
from .forms import CommentForm
from django.contrib.contenttypes.models import ContentType
from .models import Comment
from blog.models import Post


class CommentPostView(CreateView):
    template_name = "comments/comment_list.html"
    form_class = CommentForm
    model = Comment

    def post(self, request, *args, **kwargs):
        if request.is_ajax():
            return self.render_to_json_response(request, *args, **kwargs)
        return super().post(request, *args, **kwargs)

    def render_to_json_response(self, request, *args, **kwargs):
        """Render a json response of the context."""

        form = self.get_form()
        form.save(False)
        form.instance.content_type = ContentType.objects.get_for_id(
            request.POST.get('content_type'))
        form.instance.object_id = request.POST.get('object_id')
        form.instance.content = request.POST.get('content')
        form.instance.parent = None
        form.instance.root = None
        form.instance.user = request.user
        form.save(True)
        response_data = {
            'status': 'SUCCESS',
            'content': form.instance.content,
            'user': form.instance.user.username,
            'created': form.instance.created.strftime('%Y-%m-%d')
        }
        return JsonResponse(response_data)

    def get_success_url(self):
        return reverse('post-detail', kwargs={'pk': self.kwargs['pk']})

    def get(self, request, *args, **kwargs):
        return redirect('post-detail', self.kwargs['pk'])
    #
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
        return super().form_valid(form)
