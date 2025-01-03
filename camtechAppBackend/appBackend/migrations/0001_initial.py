# Generated by Django 5.1.1 on 2024-09-17 06:47

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='SubmissionForm',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nameEn', models.CharField(max_length=100)),
                ('nameKh', models.CharField(max_length=100)),
                ('nationality', models.CharField(max_length=100)),
                ('gender', models.CharField(max_length=100)),
                ('dob', models.DateField()),
                ('pob', models.CharField(max_length=100)),
                ('address', models.CharField(max_length=100)),
                ('country', models.CharField(max_length=100)),
                ('phone', models.CharField(max_length=20)),
                ('email', models.EmailField(max_length=254)),
                ('idFile', models.FileField(upload_to='uploads/')),
                ('guardianName', models.CharField(max_length=100)),
                ('guardianRelation', models.CharField(max_length=100)),
                ('guardianNationality', models.CharField(max_length=100)),
                ('guardianAddress', models.CharField(max_length=100)),
                ('guardianJob', models.CharField(max_length=100)),
                ('guardianPhone', models.CharField(max_length=20)),
                ('currentEducation', models.CharField(max_length=100)),
                ('currentMajor', models.CharField(max_length=100)),
                ('institutionName', models.CharField(max_length=100)),
                ('currentYear', models.CharField(max_length=100)),
                ('academicYear', models.CharField(max_length=100)),
                ('schoolName', models.CharField(max_length=100)),
                ('schoolAddress', models.CharField(max_length=100)),
                ('overallGrade', models.CharField(max_length=100)),
                ('mathGrade', models.CharField(max_length=100)),
                ('englishGrade', models.CharField(max_length=100)),
                ('highschoolCertificate', models.FileField(upload_to='uploads/')),
                ('IELETS', models.CharField(max_length=100)),
                ('IELTSCertificate', models.FileField(upload_to='uploads/')),
                ('interestedMajor', models.CharField(max_length=100)),
                ('requestScholarship', models.CharField(max_length=100)),
                ('requestAcademicTerm', models.CharField(max_length=100)),
                ('retry', models.CharField(max_length=100)),
                ('knowAboutUs', models.CharField(max_length=100)),
                ('consent', models.BooleanField()),
                ('declaration', models.BooleanField()),
            ],
        ),
    ]
