import 'package:e_learning/shared/components/constants.dart';
import 'package:e_learning/util/route_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomOption extends StatelessWidget {
  const BottomOption ({super.key, required this.selectedIndex});
  final int selectedIndex ;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            InkWell(
              onTap: (){
                openScreen(context, 1);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: Icon(Icons.cast_for_education_outlined, color: getSelectedColor(1),)),
                   const SizedBox(
                      height: 5,
                    ),
                    Expanded(child: Text('Courses',style: TextStyle(fontSize: 13,color: getSelectedColor(1)),)),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                openScreen(context,2);

              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: Icon(Icons.play_circle_outline, color: getSelectedColor(2),)),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(child: Text('My Courses',style: TextStyle(fontSize: 13,color: getSelectedColor(2)),)),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                openScreen(context,3);

              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: Icon(Icons.favorite_border, color: getSelectedColor(3),)),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(child: Text('Wishlist',style: TextStyle(fontSize: 13,color: getSelectedColor(3)),)),
                  ],
                ),
              ),
            ),

            InkWell(
              onTap: (){
                openScreen(context,4);

              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: Icon(Icons.video_camera_front_outlined, color: getSelectedColor(4),)),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(child: Text('Sessions',style: TextStyle(fontSize: 13,color: getSelectedColor(4)),)),
                  ],
                ),
              ),
            ),

            InkWell(
              onTap: (){
                openScreen(context,5);

              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: Icon(CupertinoIcons.briefcase, color: getSelectedColor(5),)),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(child: Text('Jobs',style: TextStyle(fontSize: 13,color: getSelectedColor(5)),)),
                  ],
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
  Color getSelectedColor(int optionIndex){
    return (selectedIndex == optionIndex )?kPrimaryColor: Colors.grey.shade800;
  }

  void openScreen(BuildContext context,int selectedOptionNo){
    String routeName = 'CoursesHome';
    switch(selectedOptionNo){

      case 2 :
        routeName = RouteNames.myCourseList ;
        break;

      case 3 :
        routeName = RouteNames.whishlist;
        break;

      case 4:
        routeName = 'MeetingsScreen';
        break;

      case 5:
        routeName = 'JobsScreen';
    }

    Navigator.pushReplacementNamed(context, routeName);
  }
}
