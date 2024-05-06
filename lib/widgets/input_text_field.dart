import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordCustomTextField extends StatelessWidget {
  PasswordCustomTextField(
      {super.key,
      required this.controller,
      required this.visibility,
      required this.hint,
      required this.icon,
      this.onPress});
  final TextEditingController controller;
  final bool visibility;
  final String hint;
  final Icon icon;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
      child: TextField(
        controller: controller, // Use the right controller to manage the input
        obscureText: visibility,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: Color(0xff000000),
        ),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: icon,
            onPressed: onPress,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: Color(0xff9f9d9d),
          ),
          filled: true,
          fillColor: Color(0xfff2f2f3),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.controller,
    required this.visibility,
    required this.hint,
  });
  final TextEditingController controller;
  final bool visibility;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
      child: TextField(
        controller: controller, // Use the right controller to manage the input
        obscureText: visibility,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          color: Color(0xff000000),
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: Color(0xff9f9d9d),
          ),
          filled: true,
          fillColor: Color(0xfff2f2f3),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
