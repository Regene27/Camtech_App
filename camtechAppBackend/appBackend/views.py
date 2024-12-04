from rest_framework.response import Response
from rest_framework import status
from rest_framework.decorators import api_view
from .serializers import SubmissionSerializer
import logging
from django.conf import settings
from django.http import HttpResponse, Http404
import os
from django.core.mail import send_mail
from django.shortcuts import render
from googleapiclient.discovery import build
from google.oauth2.service_account import Credentials
import os
from googleapiclient.http import MediaFileUpload
import tempfile
import requests
import environ
from datetime import datetime
from pathlib import Path

current_date = datetime.now().strftime("%Y-%m-%d")
current_time = datetime.now().strftime("%H:%M")


logger = logging.getLogger(__name__)

SERVICE_ACCOUNT_FILE = (
    "/home/regene/Internship/camtechApp/camtechAppBackend/google-sheets-key.json"
)

SCOPES = [
    "https://www.googleapis.com/auth/spreadsheets",
    "https://www.googleapis.com/auth/drive.file",
]

SPREADSHEET_ID = "1T_nMffYCMnt8Lzi9n5XMYVOoTQSJsAIlGPUL0yxH0kM"

ID_FOLDER = "1EnhjTqG-hXYUCGXMhhvX4KKAZtDNcLiS"
HIGHSCHOOL_CERTIFICATES_FOLDER = "1_SjpJJrOVKlp3-ARGRLugIxtHblh7_1p"
HIGHSCHOOL_ID_FOLDER = "1O3Q-G1LaroTBloaKLbzKOrbi9YN0Aukj"
IELTS_FOLDER = "1HWvAKVifbw4xiCVGuUXQAO5_e5tIMu5v"

TELEGRAM_BOT_TOKEN = settings.TELEGRAM_BOT_TOKEN
TELEGRAM_CHAT_ID = settings.TELEGRAM_CHAT_ID


def home(request):
    return render(request, "home.html")


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
                send_confirmation_email(to_email, subject, message)

                serializer.save()

                response = Response(serializer.data, status=status.HTTP_201_CREATED)

                export_data(serializer)

                telegram_message = f"New submission from {serializer.validated_data.get('nameEn')}, {serializer.validated_data.get('gender')}, {serializer.validated_data.get('dob')}. {current_date} : {current_time}"
                send_telegram_message(telegram_message)

                return response
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


def export_data(serializer):
    credentials = Credentials.from_service_account_file(
        SERVICE_ACCOUNT_FILE, scopes=SCOPES
    )
    service = build("sheets", "v4", credentials=credentials)

    def get_file_link(field_name, folder_id):
        file = serializer.validated_data.get(field_name)
        if file:
            return upload_and_get_link(file.name, file.read(), folder_id)
        return None

    id_link = get_file_link("idFile", ID_FOLDER)
    highschoolCert_link = get_file_link(
        "highschoolCertificate", HIGHSCHOOL_CERTIFICATES_FOLDER
    )
    highschoolId_link = get_file_link("highschoolIdFile", HIGHSCHOOL_ID_FOLDER)
    ielts_link = get_file_link("IELTSCertificate", IELTS_FOLDER)

    data = []

    obj = serializer.validated_data
    data.append(
        [
            obj.get("nameEn", "") or "",
            obj.get("nameKh", "") or "",
            obj.get("nationality", "") or "",
            obj.get("gender", "") or "",
            str(obj.get("dob", "")) or "",
            obj.get("pob", "") or "",
            obj.get("address", "") or "",
            obj.get("country", "") or "",
            obj.get("phone", "") or "",
            obj.get("email", "") or "",
            str(id_link) or "",
            obj.get("guardianName", "") or "",
            obj.get("guardianRelation", "") or "",
            obj.get("guardianNationality", "") or "",
            obj.get("guardianAddress", "") or "",
            obj.get("guardianJob", "") or "",
            obj.get("guardianPhone", "") or "",
            obj.get("currentEducation", "") or "",
            obj.get("currentMajor", "") or "",
            obj.get("institutionName", "") or "",
            obj.get("currentYear", "") or "",
            obj.get("academicYear", "") or "",
            obj.get("schoolName", "") or "",
            obj.get("schoolAddress", "") or "",
            obj.get("overallGrade", "") or "",
            obj.get("mathGrade", "") or "",
            obj.get("englishGrade", "") or "",
            str(highschoolCert_link) or "",
            obj.get("highschoolName", "") or "",
            obj.get("highschoolAddress", "") or "",
            str(highschoolId_link) or "",
            obj.get("IELTS", "") or "",
            str(ielts_link) or "",
            obj.get("interestedMajor", "") or "",
            obj.get("requestScholarship", "") or "",
            obj.get("requestAcademicTerm", "") or "",
            obj.get("retry", "") or "",
            obj.get("knowAboutUs", "") or "",
            obj.get("consent", "") or "",
            obj.get("declaration", "") or "",
        ]
    )

    try:
        body = {"values": data}
        service.spreadsheets().values().append(
            spreadsheetId=SPREADSHEET_ID,
            range="Sheet1!A1",
            valueInputOption="RAW",
            body=body,
        ).execute()
    except Exception as e:
        logger.error(f"Failed to write data to Google Sheets: {e}")
        return Response(
            {"error": "Failed to write data to Google Sheets"},
            status=status.HTTP_500_INTERNAL_SERVER_ERROR,
        )


def upload_and_get_link(file_name, file_content, folder_id):
    credentials = Credentials.from_service_account_file(
        SERVICE_ACCOUNT_FILE, scopes=SCOPES
    )
    drive_service = build("drive", "v3", credentials=credentials)

    with tempfile.NamedTemporaryFile(delete=False) as temp_file:
        temp_file.write(file_content)
        temp_file_path = temp_file.name

    try:
        file_metadata = {"name": file_name, "parents": [folder_id]}
        media = MediaFileUpload(temp_file_path, mimetype="application/octet-stream")

        file = (
            drive_service.files()
            .create(body=file_metadata, media_body=media, fields="id")
            .execute()
        )

        shared_link = f"https://drive.google.com/file/d/{file['id']}/view"
        return shared_link
    finally:
        os.remove(temp_file_path)


def send_telegram_message(message):
    url = f"https://api.telegram.org/bot{TELEGRAM_BOT_TOKEN}/sendMessage"
    payload = {"chat_id": TELEGRAM_CHAT_ID, "text": message, "parse_mode": "HTML"}
    response = requests.post(url, data=payload)
    return response
