import 'package:flutter/material.dart';

class passwordField extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  final IconData? icon;
  final String? Function(String?)? validator;
  const passwordField({
    super.key,
    required this.controller,
    required this.text,
    this.icon,
    this.validator,
  });

  @override
  State<passwordField> createState() => _passwordFieldState();
}

class _passwordFieldState extends State<passwordField> {
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      obscuringCharacter: '*',
      controller: widget.controller,
      cursorColor: const Color(0xFF3e48b2),
      decoration: InputDecoration(
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                _isObscured = !_isObscured;
              });
            },
            canRequestFocus: false,
            child: _isObscured
                ? const Icon(Icons.visibility_off_outlined)
                : const Icon(Icons.visibility_outlined),
          ),
          label: Text(
            widget.text,
            style: const TextStyle(color: Colors.black),
          ),
          icon: Icon(widget.icon),
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
              borderSide:
                  const BorderSide(color: Color(0xFF3e48b2), width: 1.5)),
          constraints: const BoxConstraints(maxWidth: 330)),
      keyboardType: TextInputType.visiblePassword,
      obscureText: _isObscured,
      textInputAction: TextInputAction.next,
    );
  }
}
