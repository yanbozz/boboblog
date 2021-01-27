import json
from django.shortcuts import redirect, reverse, redirect, render
from django.contrib import messages
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from django.core import serializers
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
        # redirect to login page if user not authenticated
        if not request.user.is_authenticated:
            messages.info(self.request, f"请先登录你的账号.")
            return redirect('/login/?next=%s' % self.request.path)
        # address ajax request
        if request.is_ajax():
            return self.render_to_json_response(request, *args, **kwargs)
        return super().post(request, *args, **kwargs)

    def render_to_json_response(self, request, *args, **kwargs):
        form = self.get_form()
        form.save(False)
        content_type = ContentType.objects.get_for_id(
            request.POST.get('content_type'))
        parent_id = request.POST.get('parent')
        root_id = request.POST.get('root')
        object_id = request.POST.get('object_id')
        content = request.POST.get('content')
        form.instance.content_type = content_type
        form.instance.content = content
        form.instance.parent = None
        form.instance.root = None
        form.instance.user = request.user
        context = {}
        if parent_id:
            form.instance.parent = Comment.objects.get(pk=parent_id)
            form.instance.root = Comment.objects.get(pk=root_id)
            form.save(True)
            context['child_comment'] = form.instance
            return render(request, 'comments/reply_list_template.html', context)
        form.save(True)
        context['comment'] = form.instance
        return render(request, 'comments/comment_list_template.html', context)

    def get_success_url(self):
        return reverse('post-detail', kwargs={'pk': self.kwargs['pk']})

    def get(self, request, *args, **kwargs):
        return redirect('post-detail', self.kwargs['pk'])

    def form_valid(self, form):
        # create comment instance with the form
        user = self.request.user
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
