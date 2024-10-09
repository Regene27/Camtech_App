import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart'; // For formatting dates
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as p; // For getting filename
import 'guardian_info_form.dart';
import 'personal_info_form.dart';

void main() {
  runApp(const CamTechApp());
}

class CamTechApp extends StatelessWidget {
  const CamTechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SubmissionForm(),
      debugShowCheckedModeBanner: false,
    );
  }
}
