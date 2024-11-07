import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      shape: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)))));
}
