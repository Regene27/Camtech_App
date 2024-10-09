from django.urls import path
from . import views

urlpatterns = [
    path("submit-form/", views.submit_form, name="submit_form"),
    path("uploads/id/<str:filename>/", views.your_view_function, name="upload_view"),
    path("", views.home),
]
