from django.urls import path
from .views import indexView, aboutView

urlpatterns = [
    path("about/", aboutView, name="about_view"),
    path("", indexView, name="index_view"),
]
