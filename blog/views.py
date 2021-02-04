from django.shortcuts import render, redirect, reverse
import json
from django.db.models import Count
from django.contrib import messages
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.views.generic.edit import FormMixin
from django.views.generic import (
    ListView,
    DetailView,
    CreateView,
    UpdateView,
    DeleteView
)
from django.views.generic.base import ContextMixin
from django.http import HttpResponse, HttpResponseRedirect, HttpResponseForbidden, JsonResponse
from .models import Post
from viewcount.models import ViewCount
from viewcount.utils import view_stats_once_viewed
from tag.models import PostTag, PostTagManager
from .forms import PostCreateForm
from comments.models import Comment
from comments.forms import CommentForm


class SidebarContextMixin(ContextMixin):

    # add context mixin for sidebar
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        date_qs = Post.objects.dates('pub_date', 'month', 'DESC')
        post_dates = self.get_count_in_month(date_qs)
        # count post num for each tag
        tags = PostTag.objects.get_posts_count()
        context['post_dates'] = post_dates
        context['tags'] = tags
        return context

    # count post amount per month
    def get_count_in_month(self, qs):
        qs = qs.values('datefield').annotate(post_count=Count('id'))
        post_dates = []
        for date_qs in qs:
            post_dates.append((date_qs['datefield'], date_qs['post_count']))
        return post_dates


class PostListView(ListView, SidebarContextMixin):
    model = Post
    template_name = 'blog/home.html'
    context_object_name = 'posts'
    ordering = ['-pub_date']
    paginate_by = 5


class PostListWithDateView(PostListView):

    def get_queryset(self):
        post_list = Post.objects.filter(
            pub_date__year=self.kwargs['year'],
            pub_date__month=self.kwargs['month'],
        ).order_by('-pub_date')
        return post_list


class PostTagListView(PostListView):
    template_name = 'blog/post_tag.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['tag'] = PostTag.objects.get(slug=self.kwargs['slug'])
        return context

    def get_queryset(self):
        tag_name = self.kwargs['slug']
        tag = PostTag.objects.get(slug=tag_name)
        return tag.get_posts()


class PostDetailView(DetailView, SidebarContextMixin):
    model = Post
    template_name = 'blog/post_detail.html'

    def get(self, request, *args, **kwargs):
        self.object = self.get_object()
        response = super().get(request, *args, **kwargs)
        # set cookie
        response = view_stats_once_viewed(request, response, self.object)
        return response

    def get_context_data(self, **kwargs):
        comment_form = CommentForm()
        self.object = self.get_object()
        context = super().get_context_data(**kwargs)
        comments = self.object.comments
        context['comments'] = comments
        context['comment_form'] = comment_form
        context['comment_form'].fields['content_type'].initial = self.object.get_content_type
        context['comment_form'].fields['object_id'].initial = self.object.pk
        return context


class PostCreateView(LoginRequiredMixin, CreateView):
    form_class = PostCreateForm
    success_url = '/'
    template_name = 'blog/post_form.html'

    def get_login_url(self):
        messages.info(self.request, f"请先登录你的账号.")
        return 'login'

    def form_valid(self, form):
        form.instance.author = self.request.user
        form.save(True)
        tag_list = form.cleaned_data['tags']
        PostTag.objects.add_post_to_tag(form.instance, tag_list)
        messages.success(self.request, f"发布成功!")
        return super().form_valid(form)


class PostUpdateView(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    model = Post
    fields = ['title', 'content']

    def get_login_url(self):
        messages.info(self.request, f"请先登录你的账号.")
        return 'login'

    def form_valid(self, form):
        form.instance.author = self.request.user
        messages.success(self.request, f"你刚刚重新编辑并提交了文章的内容.")
        return super().form_valid(form)

    def test_func(self):
        post = self.get_object()
        if post.author == self.request.user:
            return True
        return False


class PostDeleteView(LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    model = Post

    def get_login_url(self):
        messages.info(self.request, f"请先登录你的账号.")
        return 'login'

    def get_success_url(self):
        messages.success(self.request, f"删除成功.")
        return '/'

    def test_func(self):
        post = self.get_object()
        if post.author == self.request.user:
            return True
        return False


def about(request):
    return render(request, 'blog/about.html')
