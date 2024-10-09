import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'language_proficiency.dart';
import 'package:path/path.dart' as p;

class HighSchoolForm extends StatefulWidget {
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

  const HighSchoolForm({
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
    required String currentYearOfStudy,
    required String academicYear,
    required String major,
    required String institutionName,
    required String schoolName,
    required String cityCountry,
    required String overallGrade,
    required String mathGrade,
    required String englishGrade,
    File? certificateFile,
  });
  @override
  _HighSchoolFormState createState() => _HighSchoolFormState();
}

class _HighSchoolFormState extends State<HighSchoolForm> {
  final _formKey = GlobalKey<FormState>();
  String? highSchoolName;
  String? provinceCountry;
  File? highSchoolId;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf'], // Allow only jpg and pdf files
    );

    if (result != null) {
      setState(() {
        highSchoolId = File(result.files.single.path!); // Get the selected file
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
            highSchoolName: highSchoolName ?? '',
            provinceCountry: provinceCountry ?? '',
            highSchoolId: highSchoolId,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('High School Form'),
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
                  child: Text(
                    'High School Name',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the school name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    highSchoolName = value!;
                  },
                ),
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Province and Country',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the province and country of the school';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    provinceCountry = value!;
                  },
                ),
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Upload your grade 12 student ID card (PDF/JPG)',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(highSchoolId != null
                          ? p.basename(highSchoolId!.path)
                          : 'No file selected'),
                      ElevatedButton(
                        onPressed: _pickFile,
                        child: const Text('Upload ID File'),
                      ),
                    ]),
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                ElevatedButton(
                  onPressed: _goToLanguageProficiencyForm,
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
