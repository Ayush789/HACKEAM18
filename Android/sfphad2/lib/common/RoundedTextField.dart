import 'package:flutter/material.dart';
import 'package:sfphad/common/colors.dart';

class RoundedTextField extends StatelessWidget {
  String labelText;
  TextEditingController controller;
  bool obscureText;
  Color color;

  RoundedTextField({
    this.controller,
    this.labelText,
    this.obscureText = false,
    this.color = baseColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: color),
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: color, width: 2),
          gapPadding: 0,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: color, width: 2),
          gapPadding: 0,
        ),
      ),
      controller: controller,
      obscureText: obscureText,
    );
  }
}
