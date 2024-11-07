import 'package:e_learning/data_provider/course_data_provider.dart';
import 'package:e_learning/models/course.dart';
import 'package:e_learning/shared/components/constants.dart';
import 'package:flutter/material.dart';

class Whishlist extends StatefulWidget {
  const Whishlist({super.key});

  @override
  State<Whishlist> createState() => _WhishlistState();
}

class _WhishlistState extends State<Whishlist> {
  @override
  Widget build(BuildContext context) {
    List<Course> courseList = getCourseList(context);
    return  ListView.builder(
      shrinkWrap: true,
      itemCount: courseList.length,
      itemBuilder: (context,index){
        Course course =courseList[index];
        return getListItem(course);
      },
    );
  }
  List<Course>getCourseList(BuildContext context){
    return CourseDataProvider.courseList.where((course)=> course.isFavorite).toList();
  }

  Widget getListItem(Course course){
    return Card(
      child: ListTile(
        leading: Image.asset(course.thumbnailUrl),
        title: Text(
          course.title,
          maxLines: 2,
          style: TextStyle(fontSize: 17,color: Colors.black26),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("By ${course.createdBy}",style: const TextStyle(color: kBlueColor,fontSize: 13),),
            Row(
              children: [
                Text(
                  course.duration,
                  style: TextStyle(color: Colors.grey.shade500,fontSize: 14),
                ),
                const SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.grey,
                  child: Container(),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "${course.lessonNo} Lessons",
                  style: TextStyle(color: Colors.grey.shade500,fontSize: 14),
                ),
                const SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.grey,
                  child: Container(),
                ),
                const SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                   const  Icon(Icons.star,color: Colors.yellow,),
                    const SizedBox(
                      width: 10,
                    ),
                    Text("${course.rate}"),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text("\$${course.price}",style: TextStyle(fontSize: 15,color: Colors.grey.shade800,fontWeight: FontWeight.bold),),
                const SizedBox(width: 20,),
                InkWell(
                  onTap: (){
                    setState(() {
                      course.isFavorite = false;
                    });
                  },
                  child: const Icon(Icons.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
