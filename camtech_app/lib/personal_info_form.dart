import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart'; // For formatting dates
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as p; // For getting filename
import 'guardian_info_form.dart';

class SubmissionForm extends StatefulWidget {
  @override
  _SubmissionFormState createState() => _SubmissionFormState();
}

class _SubmissionFormState extends State<SubmissionForm> {
  final _formKey = GlobalKey<FormState>();
  String nameEn = '';
  String nameKh = '';
  String nationality = '';
  String gender = '';
  DateTime? selectedDate;
  String dob = '';
  String pob = '';
  String address = '';
  String country = '';
  String phone = '';
  String email = '';
  File? idFile;

  // Function to show date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dob = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  // Function to pick an image file
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf'], // Allow only jpg and pdf files
    );

    if (result != null) {
      setState(() {
        idFile = File(result.files.single.path!); // Get the selected file
      });
    }
  }

  void _goToParentGuardianForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ParentGuardianForm(
            nameEn: nameEn,
            nameKh: nameKh,
            nationality: nationality,
            gender: gender,
            dob: dob,
            pob: pob,
            address: address,
            country: country,
            phone: phone,
            email: email,
            idFile: idFile,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Infomation'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Card(
                  color: Colors.white, // Set the background color to white
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Name (English)',
                              style: TextStyle(fontSize: 17)),
                        ),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              nameEn = value;
                            });
                          },
                          validator: (value) {
                            return value!.isEmpty
                                ? 'Please enter your name in English'
                                : null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Name (Khmer)',
                              style: TextStyle(fontSize: 17)),
                        ),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              nameKh = value;
                            });
                          },
                          validator: (value) {
                            return value!.isEmpty
                                ? 'Please enter your name in Khmer'
                                : null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Nationality',
                              style: TextStyle(fontSize: 17)),
                        ),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              nationality = value;
                            });
                          },
                          validator: (value) {
                            return value!.isEmpty
                                ? 'Please enter your nationality'
                                : null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Gender', style: TextStyle(fontSize: 17)),
                        ),
                        DropdownButtonFormField<String>(
                          value: gender.isNotEmpty ? gender : null,
                          items:
                              ['Male', 'Female', 'Other'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              gender = value!;
                            });
                          },
                          validator: (value) {
                            return value == null || value.isEmpty
                                ? 'Please select your gender'
                                : null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Date of Birth',
                              style: TextStyle(fontSize: 17)),
                        ),
                        TextFormField(
                          controller: TextEditingController(text: dob),
                          decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.calendar_today),
                          ),
                          readOnly: true,
                          onTap: () {
                            _selectDate(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Place of Birth',
                              style: TextStyle(fontSize: 17)),
                        ),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              pob = value;
                            });
                          },
                          validator: (value) {
                            return value!.isEmpty
                                ? 'Please enter your place of birth'
                                : null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child:
                              Text('Address', style: TextStyle(fontSize: 17)),
                        ),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              address = value;
                            });
                          },
                          validator: (value) {
                            return value!.isEmpty
                                ? 'Please enter your address'
                                : null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child:
                              Text('Country', style: TextStyle(fontSize: 17)),
                        ),
                        TextFormField(
                          onChanged: (value) {
                            setState(() {
                              country = value;
                            });
                          },
                          validator: (value) {
                            return value!.isEmpty
                                ? 'Please enter your country'
                                : null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Phone Number',
                              style: TextStyle(fontSize: 17)),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          onChanged: (value) {
                            setState(() {
                              phone = value;
                            });
                          },
                          validator: (value) {
                            return value!.isEmpty
                                ? 'Please enter your phone number'
                                : null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Email', style: TextStyle(fontSize: 17)),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                          validator: (value) {
                            return value!.isEmpty || !value.contains('@')
                                ? 'Please enter a valid email'
                                : null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                                child: Text(
                                    'Birth Certificate, National ID Card or Passport (PDF/JPG)',
                                    style: TextStyle(fontSize: 17))),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 10)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(idFile != null
                                ? p.basename(idFile!.path)
                                : 'No file selected'),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.grey[200], // Text color
                              ),
                              onPressed: _pickFile,
                              child: const Text('Upload ID File'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white, // Text color
                    ),
                    onPressed: _goToParentGuardianForm,
                    child: const Text('Next')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
