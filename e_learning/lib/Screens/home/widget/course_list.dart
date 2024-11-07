import 'package:e_learning/data_provider/course_data_provider.dart';
import 'package:e_learning/models/course.dart';
import 'package:e_learning/models/course_category.dart';
import 'package:e_learning/notifier/course_catgory_change_notifier.dart';
import 'package:e_learning/screens/home/widget/course_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CourseList extends StatelessWidget {
  const CourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 2,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      children: getCourseList(context).map((course){
      return CourseItem(course: course);
      }).toList(),
    );
  }

  List<Course> getCourseList(BuildContext context){
    var category = Provider.of<CourseCatgoryChangeNotifier>(context).category;
    if(category == CourseCategory.all){
      return CourseDataProvider.courseList;
    }
    return CourseDataProvider.courseList.where((course)=> course.courseCategory == category).toList();
  }
}
