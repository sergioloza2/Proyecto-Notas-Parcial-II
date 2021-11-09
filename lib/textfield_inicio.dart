import 'package:flutter/material.dart';

class TextFieldSesion extends StatelessWidget {
  final String hintText;
  final double fontSize;
  final bool obcureText;
  final TextEditingController controller;
  const TextFieldSesion(
      {required this.hintText,
      required this.fontSize,
      required this.controller,
      this.obcureText = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obcureText,
      decoration: InputDecoration(
        hintText: hintText,
        labelStyle: TextStyle(
          fontSize: fontSize,
          color: Colors.black,
        ),
      ),
    );
  }
}
