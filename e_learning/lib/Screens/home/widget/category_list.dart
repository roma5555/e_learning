import 'package:e_learning/models/course_category.dart';
import 'package:e_learning/notifier/course_catgory_change_notifier.dart';
import 'package:e_learning/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    var category = Provider.of<CourseCatgoryChangeNotifier>(context).category;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Categories',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.grey.shade800),),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: CourseCategory.values.length,
              itemBuilder: (context,index){
                CourseCategory courseCategory = CourseCategory.values[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: (){
                  Provider.of<CourseCatgoryChangeNotifier>(context,listen: false).changeCategory(courseCategory);
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: category== courseCategory? kPrimaryColor: Colors.white,
                    border: Border.all(color: Colors.grey.shade900),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(courseCategory.title,style:  TextStyle(fontSize: 15,color: category == courseCategory? Colors.white : Colors.black),),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
