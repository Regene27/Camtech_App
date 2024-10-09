import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AppliedProgramForm extends StatefulWidget {
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
      ieltsOrToefl;
  final File? idFile, certificateFile, ieltsOrToeflCertificate;

  const AppliedProgramForm({
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
    required this.certificateFile,
    required this.ieltsOrToefl,
    required this.ieltsOrToeflCertificate,
  });
  @override
  _AppliedProgramFormState createState() => _AppliedProgramFormState();
}

class _AppliedProgramFormState extends State<AppliedProgramForm> {
  final _formKey = GlobalKey<FormState>();
  String? interestedMajor;
  String? scholarship;
  String? requestedAcademicTerm;
  String? retryEntry;
  Set<String>? howDidYouHearAboutUs = {};
  bool? consent;
  bool? declaration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Applied Program Form'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Choose your interested major',
                      style: TextStyle(fontSize: 17)),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                CheckboxListTile(
                  title: const Text('Robotics and Automation Engineering'),
                  value:
                      interestedMajor == 'Robotics and Automation Engineering',
                  onChanged: (bool? value) {
                    setState(() {
                      interestedMajor =
                          value! ? 'Robotics and Automation Engineering' : '';
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Data Science and Artificial intelligence'),
                  value: interestedMajor ==
                      'Data Science and Artificial intelligence',
                  onChanged: (bool? value) {
                    setState(() {
                      interestedMajor = value!
                          ? 'Data Science and Artificial intelligence'
                          : '';
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Software Engineering'),
                  value: interestedMajor == 'Software Engineering',
                  onChanged: (bool? value) {
                    setState(() {
                      interestedMajor = value! ? 'Software Engineering' : '';
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Cyber Security'),
                  value: interestedMajor == 'Cyber Security',
                  onChanged: (bool? value) {
                    setState(() {
                      interestedMajor = value! ? 'Cyber Security' : '';
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Architecture'),
                  value: interestedMajor == 'Architecture',
                  onChanged: (bool? value) {
                    setState(() {
                      interestedMajor = value! ? 'Architecture' : '';
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Interior Design'),
                  value: interestedMajor == 'Interior Design',
                  onChanged: (bool? value) {
                    setState(() {
                      interestedMajor = value! ? 'Interior Design' : '';
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Educational Technology'),
                  value: interestedMajor == 'Educational Technology',
                  onChanged: (bool? value) {
                    setState(() {
                      interestedMajor = value! ? 'Educational Technology' : '';
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Media and Communication Technology'),
                  value:
                      interestedMajor == 'Media and Communication Technology',
                  onChanged: (bool? value) {
                    setState(() {
                      interestedMajor =
                          value! ? 'Media and Communication Technology' : '';
                    });
                  },
                ),
                CheckboxListTile(
                  title:
                      const Text('Risk Management and Business Intelligence'),
                  value: interestedMajor ==
                      'Risk Management and Business Intelligence',
                  onChanged: (bool? value) {
                    setState(() {
                      interestedMajor = value!
                          ? 'Risk Management and Business Intelligence'
                          : '';
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Innovation and Entrepreneurship'),
                  value: interestedMajor == 'Innovation and Entrepreneurship',
                  onChanged: (bool? value) {
                    setState(() {
                      interestedMajor =
                          value! ? 'Innovation and Entrepreneurship' : '';
                    });
                  },
                ),
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Are you applying for a scholarship?',
                      style: TextStyle(fontSize: 17)),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                CheckboxListTile(
                  title: const Text('Yes'),
                  value: scholarship == 'Yes',
                  onChanged: (bool? value) {
                    setState(() {
                      scholarship = value! ? 'Yes' : '';
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('No'),
                  value: scholarship == 'No',
                  onChanged: (bool? value) {
                    setState(() {
                      scholarship = value! ? 'No' : '';
                    });
                  },
                ),
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Requested Academic Term',
                      style: TextStyle(fontSize: 17)),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                CheckboxListTile(
                  title: const Text('Term I: 13 January 2025'),
                  value: requestedAcademicTerm == 'Term I: 13 January 2025',
                  onChanged: (bool? value) {
                    setState(() {
                      requestedAcademicTerm =
                          value! ? 'Term I: 13 January 2025' : '';
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Term II: June 2025'),
                  value: requestedAcademicTerm == 'Term II: June 2025',
                  onChanged: (bool? value) {
                    setState(() {
                      requestedAcademicTerm =
                          value! ? 'Term II: June 2025' : '';
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Term III: January 2026'),
                  value: requestedAcademicTerm == 'Term III: January 2026',
                  onChanged: (bool? value) {
                    setState(() {
                      requestedAcademicTerm =
                          value! ? 'Term III: January 2026' : '';
                    });
                  },
                ),
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'If you are not successful in this requested entry intake, would you like to be considered for the next intake? ',
                      style: TextStyle(fontSize: 17)),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                CheckboxListTile(
                  title: const Text('Yes'),
                  value: retryEntry == 'Yes',
                  onChanged: (bool? value) {
                    setState(() {
                      retryEntry = value! ? 'Yes' : '';
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('No'),
                  value: retryEntry == 'No',
                  onChanged: (bool? value) {
                    setState(() {
                      retryEntry = value! ? 'No' : '';
                    });
                  },
                ),
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('How do you know CamTech?',
                      style: TextStyle(fontSize: 17)),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                CheckboxListTile(
                  title: const Text('TV advertisement'),
                  value: howDidYouHearAboutUs?.contains('TV advertisement'),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value!) {
                        howDidYouHearAboutUs?.add('TV advertisement');
                      } else {
                        howDidYouHearAboutUs?.remove('TV advertisement');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Radio advertisement'),
                  value: howDidYouHearAboutUs?.contains('Radio advertisement'),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value!) {
                        howDidYouHearAboutUs?.add('Radio advertisement');
                      } else {
                        howDidYouHearAboutUs?.remove('Radio advertisement');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Newspapers/ Social Media News'),
                  value: howDidYouHearAboutUs
                      ?.contains('Newspapers/ Social Media News'),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value!) {
                        howDidYouHearAboutUs
                            ?.add('Newspapers/ Social Media News');
                      } else {
                        howDidYouHearAboutUs
                            ?.remove('Newspapers/ Social Media News');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('CamTech Website'),
                  value: howDidYouHearAboutUs?.contains('CamTech Website'),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value!) {
                        howDidYouHearAboutUs?.add('CamTech Website');
                      } else {
                        howDidYouHearAboutUs?.remove('CamTech Website');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('CamTech Youtube channel'),
                  value:
                      howDidYouHearAboutUs?.contains('CamTech Youtube channel'),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value!) {
                        howDidYouHearAboutUs?.add('CamTech Youtube channel');
                      } else {
                        howDidYouHearAboutUs?.remove('CamTech Youtube channel');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Camtech Tik Tok'),
                  value: howDidYouHearAboutUs?.contains('Camtech Tik Tok'),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value!) {
                        howDidYouHearAboutUs?.add('Camtech Tik Tok');
                      } else {
                        howDidYouHearAboutUs?.remove('Camtech Tik Tok');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Camtech Facebook page'),
                  value:
                      howDidYouHearAboutUs?.contains('Camtech Facebook page'),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value!) {
                        howDidYouHearAboutUs?.add('Camtech Facebook page');
                      } else {
                        howDidYouHearAboutUs?.remove('Camtech Facebook page');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Friend/ relatives'),
                  value: howDidYouHearAboutUs?.contains('Friend/ relatives'),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value!) {
                        howDidYouHearAboutUs?.add('Friend/ relatives');
                      } else {
                        howDidYouHearAboutUs?.remove('Friend/ relatives');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title:
                      const Text('School / workplace connection with Camtech'),
                  value: howDidYouHearAboutUs
                      ?.contains('School / workplace connection with Camtech'),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value!) {
                        howDidYouHearAboutUs
                            ?.add('School / workplace connection with Camtech');
                      } else {
                        howDidYouHearAboutUs?.remove(
                            'School / workplace connection with Camtech');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Participation in CamTech event (s)'),
                  value: howDidYouHearAboutUs
                      ?.contains('Participation in CamTech event (s)'),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value!) {
                        howDidYouHearAboutUs
                            ?.add('Participation in CamTech event (s)');
                      } else {
                        howDidYouHearAboutUs
                            ?.remove('Participation in CamTech event (s)');
                      }
                    });
                  },
                ),
                CheckboxListTile(
                  title: const Text('Other social events'),
                  value: howDidYouHearAboutUs?.contains('Other social events'),
                  onChanged: (bool? value) {
                    setState(() {
                      if (value!) {
                        howDidYouHearAboutUs?.add('Other social events');
                      } else {
                        howDidYouHearAboutUs?.remove('Other social events');
                      }
                    });
                  },
                ),
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'CamTech University will use your e-mail for being in touch with you and inform you about our events and activities. You have the right to withdraw your consent at any time.',
                      style: TextStyle(fontSize: 15)),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text('Consent', style: TextStyle(fontSize: 17)),
                    Switch(
                      value: consent ?? false,
                      onChanged: (bool newValue) {
                        setState(() {
                          consent = newValue;
                        });
                      },
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'I declare that all information provided is correct and understand that false, inaccurate or misleading information will result in the students\' withdrawal from school.',
                      style: TextStyle(fontSize: 15)),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text('Declaration', style: TextStyle(fontSize: 17)),
                    Switch(
                      value: declaration ?? false,
                      onChanged: (bool newValue) {
                        setState(() {
                          declaration = newValue;
                        });
                      },
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.only(bottom: 60)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Process data.
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ));
  }
}
