import 'package:e_learning/data_provider/my_course_data_provider.dart';
import 'package:e_learning/models/my_course.dart';
import 'package:e_learning/shared/components/bottom_option.dart';
import 'package:e_learning/shared/components/constants.dart';
import 'package:e_learning/shared/components/shopping_cart_option.dart';
import 'package:flutter/material.dart';

class MyCoursesList extends StatelessWidget {
  const MyCoursesList({super.key});

  @override
  Widget build(BuildContext context) {
    List<MyCourse> myCourseList =MyCourseDataProvider.myCourses;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text("My Courses",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),),
              ),

              SizedBox(
height: 30,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        alignment:Alignment.center,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.black26,) ,
                        ),
                        child: const Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text("All Courses",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height:10,
              ),
              Expanded(child: ListView.builder(
                itemCount: myCourseList.length,
                itemBuilder: (context,index){
                  MyCourse myCourse = myCourseList[index];
                  return getMyCourse(myCourse,context);
                },)),
            ],
          ),
        ),
      ),

      floatingActionButton: const  ShoppingCartOption(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const  BottomOption(selectedIndex: 2,),
    );
  }

  Widget getMyCourse(MyCourse myCourse,BuildContext context){
    return Card(
      child: ListTile(
        leading: Image.asset(myCourse.course.thumbnailUrl),
        title: Text(
          myCourse.course.title,
          maxLines: 2,
          style: TextStyle(fontSize: 17,color: Colors.black26),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              myCourse.course.createdBy,
              style: TextStyle(color: Colors.white12),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Start Course",
              style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
