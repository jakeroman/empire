import 'package:empire/components/button.dart';
import 'package:flutter/material.dart';
import 'package:empire/pages/settings_page.dart';
import 'package:empire/components/app_colors.dart';
import 'package:empire/pages/navigation_page.dart';

class AppearancePage extends StatefulWidget{
  const AppearancePage({super.key});

  @override
  State<AppearancePage> createState() => _AppearancePageState();
}

class _AppearancePageState extends State<AppearancePage> {

  back() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Appearance Page!',
              style: TextStyle(
                color: AppColors.text,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              )
            ),
            Button(
              text: "Back",
              onTap: back,
            ),
          ],
        ),
      ),
    );
  }
}