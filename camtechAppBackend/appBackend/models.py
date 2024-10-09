from django.db import models


class Submission(models.Model):
    nameEn = models.CharField(max_length=100, null=True, blank=True)
    nameKh = models.CharField(max_length=100, null=True, blank=True)
    nationality = models.CharField(max_length=100, null=True, blank=True)
    gender = models.CharField(max_length=100, null=True, blank=True)
    dob = models.DateField(null=True, blank=True)
    pob = models.CharField(max_length=100, null=True, blank=True)
    address = models.CharField(max_length=100, null=True, blank=True)
    country = models.CharField(max_length=100, null=True, blank=True)
    phone = models.CharField(max_length=20, null=True, blank=True)
    email = models.EmailField(null=True, blank=True)
    idFile = models.FileField(upload_to="uploads/id/", null=True, blank=True)
    # guardianName = models.CharField(max_length=100, null=True, blank=True)
    # guardianRelation = models.CharField(max_length=100, null=True, blank=True)
    # guardianNationality = models.CharField(max_length=100, null=True, blank=True)
    # guardianAddress = models.CharField(max_length=100, null=True, blank=True)
    # guardianJob = models.CharField(max_length=100, null=True, blank=True)
    # guardianPhone = models.CharField(max_length=20, null=True, blank=True)
    # currentEducation = models.CharField(max_length=100, null=True, blank=True)
    # currentMajor = models.CharField(max_length=100, null=True, blank=True)
    # institutionName = models.CharField(max_length=100, null=True, blank=True)
    # currentYear = models.CharField(max_length=100, null=True, blank=True)
    # academicYear = models.CharField(max_length=100, null=True, blank=True)
    # schoolName = models.CharField(max_length=100, null=True, blank=True)
    # schoolAddress = models.CharField(max_length=100, null=True, blank=True)
    # overallGrade = models.CharField(max_length=100, null=True, blank=True)
    # mathGrade = models.CharField(max_length=100, null=True, blank=True)
    # englishGrade = models.CharField(max_length=100, null=True, blank=True)
    # highschoolCertificate = models.FileField(
    #     upload_to="uploads/", null=True, blank=True
    # )
    # highschoolName = models.CharField(max_length=100, null=True, blank=True)
    # highschoolAddress = models.CharField(max_length=100, null=True, blank=True)
    # highschoolIdFile = models.FileField(upload_to="uploads/", null=True, blank=True)
    # IELTS = models.CharField(max_length=100, null=True, blank=True)
    # IELTSCertificate = models.FileField(upload_to="uploads/", null=True, blank=True)
    # interestedMajor = models.CharField(max_length=100, null=True, blank=True)
    # requestScholarship = models.CharField(max_length=100, null=True, blank=True)
    # requestAcademicTerm = models.CharField(max_length=100, null=True, blank=True)
    # retry = models.CharField(max_length=100, null=True, blank=True)
    # knowAboutUs = models.CharField(max_length=100, null=True, blank=True)
    # consent = models.BooleanField(null=True, blank=True)
    # declaration = models.BooleanField(null=True, blank=True)

    def __str__(self):
        return self.nameEn
