import 'package:e_learning/notifier/course_catgory_change_notifier.dart';
import 'package:e_learning/screens/home/widget/category_list.dart';
import 'package:e_learning/screens/home/widget/course_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryCourseList extends StatelessWidget {
  const CategoryCourseList ({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => CourseCatgoryChangeNotifier(),
  child: Column(
  children: const [
  CategoryList(),
  CourseList(),
  ],
  ),);
  }
}
