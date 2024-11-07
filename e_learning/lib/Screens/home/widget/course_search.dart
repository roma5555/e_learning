import 'package:flutter/material.dart';

class CourseSearch extends StatelessWidget {
  const CourseSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      // controller: searchController,
      // keyboardType: TextInputType.text,
      // onChanged: (value){
      //   NewsCubit.get(context).getSearch(value);
      // },
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Search must not be empty';
      //   }
      //   return null;
      // },
      decoration: InputDecoration(
        hintText: 'Search for course',
        hintStyle: TextStyle(color: Colors.grey.shade400),
        filled: true,
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        prefixIcon: const Padding(padding:  EdgeInsets.only(left: 10),
            child: Icon(Icons.search,size: 20,)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        fillColor: Colors.white,
      ),
    );
  }
}
