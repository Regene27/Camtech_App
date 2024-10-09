import 'dart:io';

import 'package:flutter/material.dart';
import 'education_form.dart';

class ParentGuardianForm extends StatefulWidget {
  final String nameEn,
      nameKh,
      nationality,
      gender,
      dob,
      pob,
      address,
      country,
      phone,
      email;
  final File? idFile;

  const ParentGuardianForm({
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
  });

  @override
  _ParentGuardianFormState createState() => _ParentGuardianFormState();
}

class _ParentGuardianFormState extends State<ParentGuardianForm> {
  final _formKey = GlobalKey<FormState>();
  String guardianName = '';
  String relationship = '';
  String guardianNationality = '';
  String guardianAddress = '';
  String jobPosition = '';
  String guardianPhone = '';

  void _goToEducationForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EducationForm(
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
            guardianName: guardianName,
            relationship: relationship,
            guardianNationality: guardianNationality,
            guardianAddress: guardianAddress,
            jobPosition: jobPosition,
            guardianPhone: guardianPhone,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Parent/Guardian's Information"),
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
                  child: Text("Parent/Guardian's Name",
                      style: TextStyle(fontSize: 17)),
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      guardianName = value;
                    });
                  },
                  validator: (value) {
                    return value!.isEmpty
                        ? 'Please enter the guardian\'s name'
                        : null;
                  },
                ),
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Relationship to you',
                      style: TextStyle(fontSize: 17)),
                ),
                DropdownButtonFormField<String>(
                  value: relationship.isNotEmpty ? relationship : null,
                  items: ['Father', 'Mother', 'Sister', 'Brother', 'Other']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      relationship = value!;
                    });
                  },
                  validator: (value) {
                    return value == null || value.isEmpty
                        ? 'Please select the relationship'
                        : null;
                  },
                ),
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Nationality", style: TextStyle(fontSize: 17))),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      guardianNationality = value;
                    });
                  },
                  validator: (value) {
                    return value!.isEmpty
                        ? 'Please enter your nationality'
                        : null;
                  },
                ),
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Parent/ Guardian Current Address",
                        style: TextStyle(fontSize: 17))),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      guardianAddress = value;
                    });
                  },
                  validator: (value) {
                    return value!.isEmpty
                        ? 'Please enter your guardian\'s address'
                        : null;
                  },
                ),
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                const Align(
                    alignment: Alignment.centerLeft,
                    child:
                        Text("Job Position", style: TextStyle(fontSize: 17))),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      jobPosition = value;
                    });
                  },
                  validator: (value) {
                    return value!.isEmpty
                        ? 'Please enter your guardian\'s job position'
                        : null;
                  },
                ),
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                const Align(
                    alignment: Alignment.centerLeft,
                    child:
                        Text("Phone Number", style: TextStyle(fontSize: 17))),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      guardianPhone = value;
                    });
                  },
                  validator: (value) {
                    return value!.isEmpty
                        ? 'Please enter your guardian\'s phone number'
                        : null;
                  },
                ),
                const Padding(padding: EdgeInsets.only(bottom: 40)),
                ElevatedButton(
                    onPressed: _goToEducationForm, child: const Text('Next')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
