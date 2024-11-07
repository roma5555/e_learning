import 'package:e_learning/models/course.dart';
import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key, required this.course});
  final Course course;

  @override
  _FavouriteState createState() => _FavouriteState();
  //State<Favourite>
}

class _FavouriteState extends State<Favourite> {
  bool isFavorite = false;
  @override
  void initState(){
    super.initState();
    isFavorite = widget.course.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      setState(() {
        isFavorite = !isFavorite;
        widget.course.isFavorite = isFavorite;
      });
    }, icon: Icon(isFavorite? Icons.favorite: Icons.favorite_border,
    color: Colors.pink,));
  }
}
