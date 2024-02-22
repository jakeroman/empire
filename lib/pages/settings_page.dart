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
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
            
                  // Settings icon
                  Icon(
                    Icons.settings,
                    size: 75,
                    color: AppColors.gold,
                  ),
                ]
              ),
              
              const Text(
                'Settings',
                style: TextStyle(
                  fontSize: 32,
                    color: AppColors.text,
                    fontWeight: FontWeight.bold,
                ),
              ),

              // personal info setting
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),

                  Button(
                    text: "Personal Info",
                    onTap: personalInfo,
                  ),

                  const SizedBox(width: 80),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.chevron_right,
                          size: 20,
                          color: AppColors.gold,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // appearance setting
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),

                  Button(
                    text: "Appearance",
                    onTap: appearance,
                  ),

                  const SizedBox(width: 90),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.chevron_right,
                          size: 20,
                          color: AppColors.gold,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // sign out setting
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),

                  Button(
                    text: "Sign out",
                    onTap: signOut,
                  ),

                  const SizedBox(width: 115),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 45.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.chevron_right,
                          size: 20,
                          color: AppColors.gold,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]
          ),
        ),
      ),
    );
  }
}
