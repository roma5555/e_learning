import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key, required this.title});
final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios)),
      title: Text(title,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 22),) ,
      centerTitle: true,
    );
  }
}
