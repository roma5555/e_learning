import 'package:e_learning/argument/course_argument.dart';
import 'package:e_learning/models/course.dart';
import 'package:e_learning/shared/components/constants.dart';
import 'package:e_learning/util/route_names.dart';
import 'package:flutter/material.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({super.key, required this.course});

  final Course course;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: InkWell(
            onTap: (){
              Navigator.pushNamed(context, RouteNames.courseDetails,
              arguments: CourseArgument(course));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Flexible(child: Image.asset(course.thumbnailUrl)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(course.title,
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey.shade800),),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.person,color: kBlueColor,),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(course.createdBy,style: const TextStyle(fontSize: 12,color: kBlueColor),),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.star,size: 20,color: kRatingColor,),
                              const SizedBox(
                                width: 5,
                              ),
                              Text('${course.rate}',style: const TextStyle(fontSize: 15),),
                            ],
                          ),
                          Text('\$${course.price}',style: TextStyle(fontSize: 15,color: Colors.grey.shade800,fontWeight: FontWeight.bold),)

                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
