import 'dart:io';

import 'package:camtech_app/language_proficiency.dart';
import 'package:path/path.dart' as p;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'highschool_form.dart';

class HighSchoolGraduateForm extends StatefulWidget {
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
      guardianPhone,
      major,
      institutionName,
      currentYearOfStudy;
  final File? idFile;

  const HighSchoolGraduateForm({
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
    required this.major,
    required this.institutionName,
    required this.currentYearOfStudy,
  });
  @override
  _HighSchoolGraduateFormState createState() => _HighSchoolGraduateFormState();
}

class _HighSchoolGraduateFormState extends State<HighSchoolGraduateForm> {
  final _formKey = GlobalKey<FormState>();
  String academicYear = '';
  String schoolName = '';
  String cityCountry = '';
  String overallGrade = '';
  String mathGrade = '';
  String englishGrade = '';
  File? certificateFile;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf'], // Allow only jpg and pdf files
    );

    if (result != null) {
      setState(() {
        certificateFile =
            File(result.files.single.path!); // Get the selected file
      });
    }
  }

  void _goToLanguageProficiencyForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LanguageProficiencyForm(
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
            academicYear: '',
            schoolName: '',
            cityCountry: '',
            overallGrade: '',
            mathGrade: '',
            englishGrade: '',
            certificateFile: null,
            highschoolName: '',
            provinceCountry: '',
            highschoolId: null,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('High School Graduate Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Academic Year', style: TextStyle(fontSize: 17)),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the academic year';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    academicYear = value!;
                  },
                ),
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('School Name', style: TextStyle(fontSize: 17)),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the school name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    schoolName = value!;
                  },
                ),
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('City and Country of School',
                      style: TextStyle(fontSize: 17)),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the city and country of the school';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    cityCountry = value!;
                  },
                ),
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Overall Grade', style: TextStyle(fontSize: 17)),
                ),
                DropdownButtonFormField<String>(
                  items: ['A', 'B', 'C', 'D', 'E', 'Other']
                      .map((grade) => DropdownMenuItem(
                            value: grade,
                            child: Text(grade),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your overall grade';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    overallGrade = value!;
                  },
                ),
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Math Grade', style: TextStyle(fontSize: 17)),
                ),
                DropdownButtonFormField<String>(
                  items: ['A', 'B', 'C', 'D', 'E', 'F', 'Other']
                      .map((grade) => DropdownMenuItem(
                            value: grade,
                            child: Text(grade),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your math grade';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    mathGrade = value!;
                  },
                ),
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('English Grade', style: TextStyle(fontSize: 17)),
                ),
                DropdownButtonFormField<String>(
                  items: ['A', 'B', 'C', 'D', 'E', 'F', 'Other']
                      .map((grade) => DropdownMenuItem(
                            value: grade,
                            child: Text(grade),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your English grade';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    englishGrade = value!;
                  },
                ),
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'High school certificate or any equivalent document (PDF/JPG)',
                      style: TextStyle(fontSize: 17)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(certificateFile != null
                        ? p.basename(certificateFile!.path)
                        : 'No file selected'),
                    ElevatedButton(
                      onPressed: _pickFile,
                      child: const Text('Upload ID File'),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _goToLanguageProficiencyForm();
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
