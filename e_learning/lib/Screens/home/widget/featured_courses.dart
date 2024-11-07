import 'package:e_learning/data_provider/course_data_provider.dart';
import 'package:e_learning/models/course.dart';
import 'package:e_learning/screens/home/widget/course_item.dart';
import 'package:e_learning/util/route_names.dart';
import 'package:flutter/material.dart';

class FeaturedCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<Course> featuredCourseList =[
      CourseDataProvider.courseList[9],
      CourseDataProvider.courseList[0],
      CourseDataProvider.courseList[1],
      CourseDataProvider.courseList[2],
      CourseDataProvider.courseList[10],
      CourseDataProvider.courseList[5],

    ];


    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Featured Courses",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Text("See All",style: TextStyle(color: Colors.blue,fontSize: 15),),
            ),
          ],
        ),
        const SizedBox(height: 10),

        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: featuredCourseList.length,
            itemBuilder: (context, index) {
              Course course = featuredCourseList[index];
              return CourseItem(course: course,);
            },
          ),
        ),
      ],
    );
  }
}
