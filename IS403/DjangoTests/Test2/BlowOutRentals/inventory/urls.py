from django.urls import path
from .views import inventoryView, instrumentView

urlpatterns = [
    path("<str:instrument_name>/<int:instrument_price>/", instrumentView, name="instrument_view"),
    path("", inventoryView, name="inventory_view"),
]
