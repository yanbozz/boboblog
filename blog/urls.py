from django.urls import path

from .views import (
    PostListView,
    PostDetailView,
    PostCreateView,
    PostUpdateView,
    PostDeleteView,
    PostListWithDateView,
    about,
)
from viewcount.views import ViewDataView
from . import views


urlpatterns = [
    path('', PostListView.as_view(), name='blog-home'),
    path('post/<int:pk>/', PostDetailView.as_view(), name='post-detail'),
    path('post/new/', PostCreateView.as_view(), name='post-create'),
    path('post/<int:pk>/update/',
         PostUpdateView.as_view(template_name="blog/post_update_form.html"), name='post-update'),
    path('post/<int:pk>/delete/',
         PostDeleteView.as_view(), name='post-delete'),
    path('date/<int:year>/<int:month>', PostListWithDateView.as_view(), name='posts-with-date'),
    path('post/view_data', ViewDataView.as_view(), name='posts-view-data'),
    path('about', views.about, name='blog-about'),

]
