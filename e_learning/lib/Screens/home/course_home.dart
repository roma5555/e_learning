import 'package:e_learning/Widgets/custom_drawer.dart';
import 'package:e_learning/screens/home/widget/category_course_list.dart';
import 'package:e_learning/screens/home/widget/course_search.dart';
import 'package:e_learning/screens/home/widget/featured_courses.dart';
import 'package:e_learning/screens/home/widget/header.dart';
import 'package:e_learning/screens/home/widget/offers.dart';
import 'package:e_learning/shared/components/bottom_option.dart';
import 'package:e_learning/shared/components/constants.dart';
import 'package:e_learning/shared/components/shopping_cart_option.dart';
import 'package:flutter/material.dart';

class CourseHome extends StatefulWidget {

  const CourseHome({super.key});

  @override
  State<CourseHome> createState() => _CourseHomeState();
}

class _CourseHomeState extends State<CourseHome> {
  bool _isPressed = false;
  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
  GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(

        onPressed: () {
          setState(() {
            _isPressed = !_isPressed;
          });
          if (_drawerscaffoldkey.currentState!.isDrawerOpen) {
            Navigator.pop(context);
          } else {
            _drawerscaffoldkey.currentState!.openDrawer();
          }
        },
        icon: _isPressed
            ? const Icon(
          Icons.close,
          size: 38,
        )
            : const Icon(
          Icons.list_rounded,
          size: 38,
        ),
        style: const ButtonStyle(
            overlayColor: WidgetStatePropertyAll(kPrimaryColor)),
              ),
      ),
      body: Scaffold(
        key: _drawerscaffoldkey,
        drawer: const Customdrawer(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                  Container(
                      height: 170,
                      decoration: const BoxDecoration(
                        color:  kPrimaryColor ,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                      )
                      ,child:   const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25,vertical: 10,),
                      child: Column(
                        children:  [
                          SizedBox(
                            height: 10,
                          ),
                          Header(),
                          SizedBox(
                            height: 10,
                          ),
                          CourseSearch(),
                        ],
                      ),)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Offers(),
                       //const
                      FeaturedCourses(),
                      const CategoryCourseList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: const ShoppingCartOption(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const BottomOption(selectedIndex: 1,),
      ),
    );
  }
}
