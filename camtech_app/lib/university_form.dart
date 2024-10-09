import 'package:flutter/material.dart';
import 'dart:io';
import 'highschool_graduate_form.dart';

class UniversityForm extends StatefulWidget {
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

  const UniversityForm({
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
  _UniversityFormState createState() => _UniversityFormState();
}

class _UniversityFormState extends State<UniversityForm> {
  final _formKey = GlobalKey<FormState>();
  String major = '';
  String institutionName = '';
  String currentYearOfStudy = '';

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
            major: major,
            institutionName: institutionName,
            currentYearOfStudy: currentYearOfStudy,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('University Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Current Major', style: TextStyle(fontSize: 17)),
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    major = value;
                  });
                },
                validator: (value) {
                  return value!.isEmpty ? 'Please enter your major' : null;
                },
              ),
              const Padding(padding: EdgeInsets.only(bottom: 40)),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Institution Name', style: TextStyle(fontSize: 17)),
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    institutionName = value;
                  });
                },
                validator: (value) {
                  return value!.isEmpty
                      ? 'Please enter your institution name'
                      : null;
                },
              ),
              const Padding(padding: EdgeInsets.only(bottom: 40)),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Current Year of Study',
                    style: TextStyle(fontSize: 17)),
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    currentYearOfStudy = value;
                  });
                },
                validator: (value) {
                  return value!.isEmpty
                      ? 'Please enter your current year of study'
                      : null;
                },
              ),
              const Padding(padding: EdgeInsets.only(bottom: 40)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _goToHighSchoolGraduateForm();
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
