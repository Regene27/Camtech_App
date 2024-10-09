import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as p;
import 'applied_program.dart';

class LanguageProficiencyForm extends StatefulWidget {
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
      currentYearOfStudy,
      academicYear,
      major,
      institutionName,
      schoolName,
      cityCountry,
      overallGrade,
      mathGrade,
      englishGrade,
      highSchoolName,
      provinceCountry;
  final File? idFile, certificateFile, highSchoolId;

  const LanguageProficiencyForm({
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
    required this.currentYearOfStudy,
    required this.academicYear,
    required this.major,
    required this.institutionName,
    required this.schoolName,
    required this.cityCountry,
    required this.overallGrade,
    required this.mathGrade,
    required this.englishGrade,
    required this.highSchoolName,
    required this.provinceCountry,
    required this.certificateFile,
    required this.highSchoolId,
  });

  @override
  _LanguageProficiencyFormState createState() =>
      _LanguageProficiencyFormState();
}

class _LanguageProficiencyFormState extends State<LanguageProficiencyForm> {
  String? ieltsOrToefl;
  File? ieltsOrToeflCertificate;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf'], // Allow only jpg and pdf files
    );

    if (result != null) {
      setState(() {
        ieltsOrToeflCertificate =
            File(result.files.single.path!); // Get the selected file
      });
    }
  }

  void _goToAppliedProgramForm() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AppliedProgramForm(
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
          highSchoolName: widget.highSchoolName,
          provinceCountry: widget.provinceCountry,
          highSchoolId: widget.highSchoolId,
          ieltsOrToefl: ieltsOrToefl ?? '',
          ieltsOrToeflCertificate: ieltsOrToeflCertificate,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Proficiency'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Do you have IELTS or TOEFL certificate? (For non-native English speaker only)',
            style: TextStyle(fontSize: 16),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          CheckboxListTile(
            title: const Text('IELTS'),
            value: ieltsOrToefl == 'IELTS',
            onChanged: (bool? value) {
              setState(() {
                ieltsOrToefl = value! ? 'IELTS' : '';
              });
            },
          ),
          CheckboxListTile(
            title: const Text('TOELF'),
            value: ieltsOrToefl == 'TOELF',
            onChanged: (bool? value) {
              setState(() {
                ieltsOrToefl = value! ? 'TOELF' : '';
              });
            },
          ),
          CheckboxListTile(
            title: const Text('None'),
            value: ieltsOrToefl == 'None',
            onChanged: (bool? value) {
              setState(() {
                ieltsOrToefl = value! ? 'None' : '';
              });
            },
          ),
          const Padding(padding: EdgeInsets.only(bottom: 40)),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text('IELTS or TOEFL certificate (PDF/JPG)',
                style: TextStyle(fontSize: 17)),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(ieltsOrToeflCertificate != null
                  ? p.basename(ieltsOrToeflCertificate!.path)
                  : 'No file selected'),
              ElevatedButton(
                onPressed: _pickFile,
                child: const Text('Upload File'),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(bottom: 60)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _goToAppliedProgramForm();
                },
                child: const Text('Next'),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
