from rest_framework.response import Response
from rest_framework import status
from rest_framework.decorators import api_view
from .models import Submission
from .serializers import SubmissionSerializer
import logging
from django.conf import settings
from django.http import HttpResponse, Http404
import os

logger = logging.getLogger(__name__)


@api_view(["POST"])
def submit_form(request):
    if request.method == "POST":
        logger.info(f"Received request: {request.body}")
        print(f"Received request: {request.body}")
        serializer = SubmissionSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


def your_view_function(request, filename):
    file_path = os.path.join(settings.MEDIA_ROOT, "uploads/id/", filename)

    if os.path.exists(file_path):
        with open(file_path, "rb") as f:
            response = HttpResponse(f.read(), content_type="image/jpeg")
            response["Content-Disposition"] = f'attachment; filename="{filename}"'
            return response
    else:
        raise Http404("File does not exist")
