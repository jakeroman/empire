import 'package:empire/components/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:empire/components/button.dart';
import 'package:empire/pages/extra_settings_pages/personal_info_page.dart';
import 'package:empire/pages/extra_settings_pages/appearance_page.dart';
import 'package:empire/pages/extra_settings_pages/confirm_signout_page.dart';
import 'package:empire/pages/navigation_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key,});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  // Navigate to the personal info page
  personalInfo() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  PersonalInfoPage()),
    );
  }

  // Navigate to the appearance page
  appearance() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AppearancePage()),
    );
  }

  // Navigate to sign out page
  signOut() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ConfirmSignoutPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),

              const Icon(
                Icons.settings,
                size: 75,
                color: AppColors.gold,
              ),

              const SizedBox(height: 25),

              const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 32,
                    color: AppColors.text,
                    fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 45),

              Button(
                text:'Personal Info',
                onTap: personalInfo,
              ),

              const SizedBox(height: 30),

              Button(
                text:'Appearance',
                onTap: appearance,
              ),

              const SizedBox(height: 30),

              Button(
                text:'Sign Out',
                onTap: signOut,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
