from django.contrib import admin
from .models import Submission


class SubmissionAdmin(admin.ModelAdmin):
    list_display = "nameEn"


admin.site.register(Submission)
