import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  const CustomText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold),text);
  }
}
