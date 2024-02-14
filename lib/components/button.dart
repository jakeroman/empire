import 'package:empire/components/app_colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const Button({
    super.key, 
    required this.onTap, 
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: AppColors.raised,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.text,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}