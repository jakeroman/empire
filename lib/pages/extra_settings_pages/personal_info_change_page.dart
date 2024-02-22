import 'package:empire/components/button.dart';
import 'package:empire/components/my_textfield.dart';
import 'package:empire/pages/auth_page.dart';
import 'package:empire/pages/extra_settings_pages/personal_info_page.dart';
import 'package:flutter/material.dart';
import 'package:empire/pages/settings_page.dart';
import 'package:empire/components/app_colors.dart';
import 'package:empire/pages/navigation_page.dart';
import 'package:empire/services/firestore_service.dart';

class PersonalInfoChangePage extends StatefulWidget{
  const PersonalInfoChangePage({super.key});

  @override
  State<PersonalInfoChangePage> createState() => _PersonalInfoChangePageState();
}

class _PersonalInfoChangePageState extends State<PersonalInfoChangePage> {
  // controllers
  final firstNameController = TextEditingController();

  // Go back to settings page
  back() {
    Navigator.pop(context);
  }

  void changeInfo() {
    FirestoreService fss = FirestoreService();
    // Update name change
    fss.updateUserInfo("first_name", firstNameController.text);

    // update user info version to latest
    fss.updateUserInfo("info_version", AuthPage.currentUserInfoVersion);
    back();
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
              'Please enter a name to change to:',
              style: TextStyle(
                color: AppColors.hint,
                fontWeight: FontWeight.normal,
                fontSize: 20
              ),
            ),

            const SizedBox(height: 10),

            MyTextField(
              controller: firstNameController, 
              hintText: 'First Name', 
              obscureText: false
            ),

            const SizedBox(height: 25,),

            Button(
              text: "Save your name change",
              onTap: changeInfo,
            ),

            const SizedBox(height: 350),

            Button(
              text: "Back to personal info page",
              onTap: back,
            ),
          ],
        ),
      ),
    );
  }
}