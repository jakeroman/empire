import 'package:empire/components/app_colors.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Text(
            "Loading",
            style: TextStyle(
              color: AppColors.text,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
