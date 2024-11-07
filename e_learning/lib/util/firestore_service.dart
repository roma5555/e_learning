import 'dart:convert';
import 'package:flutter/services.dart'; // For rootBundle
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning/models/course.dart'; // Ensure you have your Course model
import 'package:e_learning/models/section.dart'; // Ensure you have your Section model

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to upload courses from JSON
  Future<void> uploadCourses() async {
    // Load the JSON file
    String jsonString = await rootBundle.loadString('assets/courses.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);

    // Get the list of courses
    List<dynamic> coursesList = jsonData['courses'];

    // Upload each course to Firestore
    for (var courseData in coursesList) {
      Course course = Course.fromMap(courseData);
      await _firestore.collection('courses').doc(course.id).set(course.toMap());
    }
  }
}
