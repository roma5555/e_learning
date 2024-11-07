

import 'package:e_learning/models/course_category.dart';
import 'package:flutter/material.dart';

class CourseCatgoryChangeNotifier extends ChangeNotifier{
  CourseCategory _category = CourseCategory.all;
  CourseCategory get category => _category;

  void changeCategory(CourseCategory category){
      _category = category;
      notifyListeners();
  }
}