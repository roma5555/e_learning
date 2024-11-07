import 'package:flutter/material.dart';

class Customelevatedbutton extends StatelessWidget {
  final String text;
  final double? w, h;
  final Color color;
  final Color? bgcolor;
  final IconData? icon;
  final VoidCallback OnPressed;
  final double fontSize;
  const Customelevatedbutton(
      {super.key, required this.text,
      required this.h,
      this.w,
      required this.color,
      this.bgcolor,
      this.icon,
      required this.OnPressed, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      height: h,
      child: ElevatedButton.icon(
        onPressed: OnPressed,
        style: ElevatedButton.styleFrom(
          surfaceTintColor: color,
          foregroundColor: color,
          backgroundColor: bgcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        icon: icon != null ? Icon(icon,size: 35,) : const SizedBox.shrink(),
        label: Text(text,style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
