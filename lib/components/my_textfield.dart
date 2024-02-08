// ignore_for_file: prefer_const_constructors

import 'package:empire/components/app_colors.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: AppColors.hint)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: AppColors.gold)),
          fillColor: AppColors.raised,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.hint),
        ),
        style: TextStyle(color: AppColors.text),
      ),
    );
  }
}
