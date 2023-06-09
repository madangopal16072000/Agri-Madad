import 'dart:io';

import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  TextEditingController controller;
  final String labeltext;
  final bool isobscure;
  final IconData icon;
  final VoidCallback? ontap;

  TextInputField({
    super.key,
    required this.controller,
    required this.labeltext,
    required this.isobscure,
    required this.icon,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: ontap,
      controller: controller,
      obscureText: isobscure,
      decoration: InputDecoration(
        labelText: labeltext,
        prefixIcon: Icon(icon),
        labelStyle: TextStyle(
          fontSize: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Colors.black12,
          ),
        ),
      ),
    );
  }
}
