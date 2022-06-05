from django.urls import path
from .views import indexPageView

urlpatterns = [
    path("<visitor_name>", indexPageView, name="index"),
]
