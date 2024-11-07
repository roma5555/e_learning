import 'package:flutter/material.dart';

class Customdivider extends StatelessWidget {
  const Customdivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.black12,
      indent: 20,
      endIndent: 20,
    );
  }
}
