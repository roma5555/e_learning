import 'package:flutter/material.dart';

class textfield extends StatefulWidget {
  final double w;
  final String text;
  var controller;
  final IconData? icon;
  String? Function(String?)? validator;
  textfield({
    super.key,
    required this.w,
    required this.text,
    required this.controller,
    this.icon,
    this.validator,
  });

  @override
  State<textfield> createState() => _textfieldState();
}

class _textfieldState extends State<textfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      validator: widget.validator,
      controller: widget.controller,
      keyboardType: TextInputType.text,
      cursorColor: const Color(0xFF3e48b2),
      decoration: InputDecoration(
          suffix: const Icon(
            null,
            size: 23,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.black, width: 1.5)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.red, width: 1.5)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.red, width: 1.5)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Color(0xFF3e48b2), width: 1.5)),
          label: Text(
            widget.text,
            style: const TextStyle(color: Colors.black),
          ),
          icon:
              widget.icon != null ? Icon(widget.icon) : const SizedBox.shrink(),
          constraints: BoxConstraints(maxWidth: widget.w)),
      textInputAction: TextInputAction.next,

    );
  }
}
