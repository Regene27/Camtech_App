from rest_framework.response import Response
from rest_framework import status
from rest_framework.decorators import api_view
from .models import Submission
from .serializers import SubmissionSerializer
import logging
from django.conf import settings
from django.http import HttpResponse, Http404
from rest_framework.parsers import MultiPartParser
import os
from django.core.mail import send_mail
from django.conf import settings
from django.shortcuts import render
import pyrebase
import firebase_admin
from firebase_admin import credentials, firestore

logger = logging.getLogger(__name__)

firebaseConfig = {
    "apiKey": "AIzaSyBAxkLjhNU0L1i0LW57fDiIUs-JcUObSKA",
    "authDomain": "camtech-app-76d33.firebaseapp.com",
    "projectId": "camtech-app-76d33",
    "storageBucket": "camtech-app-76d33.appspot.com",
    "messagingSenderId": "890703025917",
    "appId": "1:890703025917:web:526eaeed6c8e825c115094",
    "measurementId": "G-N9HMVNEE9M",
    "databaseURL": "https://camtech-app-76d33-default-rtdb.asia-southeast1.firebasedatabase.app",
}
firebase = pyrebase.initialize_app(firebaseConfig)
authe = firebase.auth()
database = firebase.database()

db = firestore.client()

cred = credentials.Certificate(
    "camtech-app-76d33-firebase-adminsdk-of9gr-6e8a0c1ab5.json"
)
firebase_admin.initialize_app(cred)


def home(request):
    submissions = database.child("submissions").get().val()
    return render(request, "home.html", {"submissions": submissions})


def send_confirmation_email(to_email, subject, message):
    send_mail(
        subject,
        message,
        settings.DEFAULT_FROM_EMAIL,
        [to_email],
        fail_silently=False,
    )


@api_view(["POST"])
def submit_form(request):
    if request.method == "POST":
        serializer = SubmissionSerializer(data=request.data)
        if serializer.is_valid():
            to_email = serializer.validated_data.get("email")
            subject = "Form Submission Successful"
            message = "Thank you for applying to Cambodia University of Technology and Science! We have received your admission form, and our admissions team is now reviewing your application.\n\nWhat to Expect Next:\n    •  Our team will assess your application and may reach out if additional documents or information are required.\n    •  We will notify you about the next steps in the application process. You can expect to hear from us soon.\n\nNeed Assistance? If you have any questions, please contact us at info@camtech.edu.kh.\n\nThank you for your interest in Cambodia University of Technology and Science. We wish you success in your application journey and look forward to the possibility of welcoming you to our university community!"

            try:
                # Send confirmation email
                send_confirmation_email(to_email, subject, message)

                # Save submission data to Firebase
                submission_data = serializer.validated_data
                database.child("submissions").push(submission_data)

                # Optionally save to local SQLite database
                serializer.save()  # If you still want to keep this local

                return Response(serializer.data, status=status.HTTP_201_CREATED)
            except Exception as e:
                logger.error(f"Failed to send confirmation email: {e}")
                return Response(
                    {"error": "Failed to send confirmation email"},
                    status=status.HTTP_500_INTERNAL_SERVER_ERROR,
                )
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
