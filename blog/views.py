from django.shortcuts import render, redirect, reverse
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

from django.http import HttpResponse, HttpResponseRedirect, HttpResponseForbidden
from .models import Post
from viewcount.models import ViewCount
from .forms import PostCreateForm
from comments.models import Comment
from comments.forms import CommentForm


class PostListView(ListView):
    model = Post
    template_name = 'blog/home.html'
    context_object_name = 'posts'
    ordering = ['-pub_date']
    paginate_by = 5

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        date_qs = Post.objects.dates('pub_date', 'month', 'DESC')
        post_dates = self.get_count_in_month(date_qs)
        context['post_dates'] = post_dates
        return context

    # count post amount per month
    def get_count_in_month(self, qs):
        qs = qs.values('datefield').annotate(post_count=Count('id'))
        post_dates = []
        for date_qs in qs:
            post_dates.append((date_qs['datefield'], date_qs['post_count']))
        return post_dates


class PostListWithDateView(PostListView):

    def get_queryset(self):
        post_list = Post.objects.filter(
            pub_date__year=self.kwargs['year'],
            pub_date__month=self.kwargs['month'],
        ).order_by('-pub_date')
        return post_list


class PostDetailView(FormMixin, DetailView):
    model = Post
    template_name = 'blog/post_detail.html'
    form_class = CommentForm

    def get(self, request, *args, **kwargs):
        self.object = self.get_object()
        response = super().get(request, *args, **kwargs)
        # set cookie
        if not request.COOKIES.get('blog_%s_viewed' % self.object.pk):
            # create and increment by 1
            views = ViewCount.objects.filter(post=self.object).first()
            if not views:
                views = ViewCount.objects.create(
                    content_type=self.object.get_content_type,
                    object_id=self.object.pk
                )
            views.count += 1
            views.save()
            response.set_cookie('blog_%s_viewed' % self.object.pk, 'true',)
        return response

    def post(self, request, *args, **kwargs):
        if not request.user.is_authenticated:
            messages.info(self.request, f"请先登录你的账号.")
            return redirect('/login/?next=%s' % request.path)
        form = self.get_form()
        form.save(False)
        if form.is_valid():
            parent_obj = None
            root_obj = None
            try:
                parent_id = int(request.POST.get("parent_id"))
            except:
                parent_id = None
            if parent_id:
                parent_qs = Comment.objects.filter(id=parent_id)
                if parent_qs.exists():
                    parent_obj = parent_qs.first()
                    root_obj = parent_obj.root if parent_obj.root else parent_obj
            form.instance.user = request.user
            form.instance.parent = parent_obj
            form.instance.root = root_obj
            form.save(True)
            return self.form_valid(form)
        form.save(True)
        return self.form_invalid(form)

    def get_context_data(self, **kwargs):
        comment_form = self.get_form()
        self.object = self.get_object()
        context = super().get_context_data(**kwargs)
        comments = self.object.comments
        context['comments'] = comments
        context['comment_form'] = comment_form
        context['comment_form'].fields['content_type'].initial = self.object.get_content_type
        context['comment_form'].fields['object_id'].initial = self.object.pk
        return context

    def form_valid(self, form):
        messages.success(self.request, f"评论发布成功.")
        post = self.get_object()
        comment = form.instance.root if form.instance.root else form.instance
        return HttpResponseRedirect('%s#div-comment-%d' % (post.get_absolute_url(), comment.pk))


class PostCreateView(LoginRequiredMixin, CreateView):
    form_class = PostCreateForm
    success_url = '/'
    template_name = 'blog/post_form.html'

    def get_login_url(self):
        messages.info(self.request, f"请先登录你的账号.")
        return 'login'

    def form_valid(self, form):
        form.instance.author = self.request.user
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
