import 'package:flutter/material.dart';

class Customlisttile extends StatefulWidget {

  Customlisttile({super.key, required this.text, this.icon, required this.onTap,  this.data});

  final String text;
  final IconData? icon;
  final VoidCallback onTap ;
  final String? data;


  @override
  State<Customlisttile> createState() => _CustomlisttileState();
}

class _CustomlisttileState extends State<Customlisttile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.text),
      subtitle: widget.data != null
          ? Text(
        widget.data!,
        style: const TextStyle(color: Colors.black, fontSize: 20),
      )
          : null,
      subtitleTextStyle: const TextStyle(color: Colors.black,fontSize: 20),

      leading: Icon(widget.icon,size:30 ,),
      titleTextStyle: const TextStyle(color: Color(0xFF3e48b2),fontWeight: FontWeight.bold,fontSize: 28),
      iconColor: const Color(0xFF3e48b2),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: widget.onTap,
    );
  }
}
