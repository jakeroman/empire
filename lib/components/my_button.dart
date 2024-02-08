// ignore_for_file: prefer_const_constructors

import 'package:empire/components/app_colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const MyButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(25),
          margin: EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
              color: AppColors.gold, borderRadius: BorderRadius.circular(8)),
          child: Center(
              child: Text(text,
                  style: TextStyle(
                    color: AppColors.text,
                    fontWeight: FontWeight.bold,
                  )))),
    );
  }
}
