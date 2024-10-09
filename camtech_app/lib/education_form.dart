import 'package:flutter/material.dart';
import 'dart:io';
import 'highschool_form.dart';
import 'highschool_graduate_form.dart';
import 'university_form.dart';

class EducationForm extends StatefulWidget {
  final String nameEn,
      nameKh,
      nationality,
      gender,
      dob,
      pob,
      address,
      country,
      phone,
      email,
      guardianName,
      relationship,
      guardianNationality,
      guardianAddress,
      jobPosition,
      guardianPhone;
  final File? idFile;

  const EducationForm({
    required this.nameEn,
    required this.nameKh,
    required this.nationality,
    required this.gender,
    required this.dob,
    required this.pob,
    required this.address,
    required this.country,
    required this.phone,
    required this.email,
    required this.idFile,
    required this.guardianName,
    required this.relationship,
    required this.guardianNationality,
    required this.guardianAddress,
    required this.jobPosition,
    required this.guardianPhone,
  });
  @override
  _EducationFormState createState() => _EducationFormState();
}

class _EducationFormState extends State<EducationForm> {
  final _formKey = GlobalKey<FormState>();
  String education = '';

  void _goToHighSchoolForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HighSchoolForm(
            nameEn: widget.nameEn,
            nameKh: widget.nameKh,
            nationality: widget.nationality,
            gender: widget.gender,
            dob: widget.dob,
            pob: widget.pob,
            address: widget.address,
            country: widget.country,
            phone: widget.phone,
            email: widget.email,
            idFile: widget.idFile,
            guardianName: widget.guardianName,
            relationship: widget.relationship,
            guardianNationality: widget.guardianNationality,
            guardianAddress: widget.guardianAddress,
            jobPosition: widget.jobPosition,
            guardianPhone: widget.guardianPhone,
            currentYearOfStudy: '',
            academicYear: '',
            major: '',
            institutionName: '',
            schoolName: '',
            cityCountry: '',
            overallGrade: '',
            mathGrade: '',
            englishGrade: '',
            certificateFile: null,
          ),
        ),
      );
    }
  }

  void _goToHighSchoolGraduateForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HighSchoolGraduateForm(
            nameEn: widget.nameEn,
            nameKh: widget.nameKh,
            nationality: widget.nationality,
            gender: widget.gender,
            dob: widget.dob,
            pob: widget.pob,
            address: widget.address,
            country: widget.country,
            phone: widget.phone,
            email: widget.email,
            idFile: widget.idFile,
            guardianName: widget.guardianName,
            relationship: widget.relationship,
            guardianNationality: widget.guardianNationality,
            guardianAddress: widget.guardianAddress,
            jobPosition: widget.jobPosition,
            guardianPhone: widget.guardianPhone,
            major: '',
            institutionName: '',
            currentYearOfStudy: '',
          ),
        ),
      );
    }
  }

  void _goToUniversityForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UniversityForm(
            nameEn: widget.nameEn,
            nameKh: widget.nameKh,
            nationality: widget.nationality,
            gender: widget.gender,
            dob: widget.dob,
            pob: widget.pob,
            address: widget.address,
            country: widget.country,
            phone: widget.phone,
            email: widget.email,
            idFile: widget.idFile,
            guardianName: widget.guardianName,
            relationship: widget.relationship,
            guardianNationality: widget.guardianNationality,
            guardianAddress: widget.guardianAddress,
            jobPosition: widget.jobPosition,
            guardianPhone: widget.guardianPhone,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('General Education'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('What is your current education?',
                    style: TextStyle(fontSize: 17)),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 20)),
              CheckboxListTile(
                title: const Text('University'),
                value: education == 'University',
                onChanged: (bool? value) {
                  setState(() {
                    education = value! ? 'University' : '';
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('High School Graduate'),
                value: education == 'High School Graduate',
                onChanged: (bool? value) {
                  setState(() {
                    education = value! ? 'High School Graduate' : '';
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('12th Grader'),
                value: education == '12th Grader',
                onChanged: (bool? value) {
                  setState(() {
                    education = value! ? '12th Grader' : '';
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (education == 'University') {
                      _goToUniversityForm();
                    } else if (education == 'High School Graduate') {
                      _goToHighSchoolGraduateForm();
                    } else if (education == '12th Grader') {
                      _goToHighSchoolForm();
                    }
                  }
                },
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
