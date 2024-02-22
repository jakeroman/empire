import 'package:empire/components/button.dart';
import 'package:empire/components/my_textfield.dart';
import 'package:empire/pages/auth_page.dart';
import 'package:empire/pages/extra_settings_pages/personal_info_change_page.dart';
import 'package:flutter/material.dart';
import 'package:empire/pages/settings_page.dart';
import 'package:empire/components/app_colors.dart';
import 'package:empire/pages/navigation_page.dart';
import 'package:empire/services/firestore_service.dart';

class PersonalInfoPage extends StatefulWidget{
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  // Go back to settings page
  back() {
    Navigator.pop(context);
  }

  // Go to change info page
  changeName() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PersonalInfoChangePage()), ).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    FirestoreService fss = FirestoreService();
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 75,),

                Text(
                  'Personal Info Page!',
                  style: TextStyle(
                    color: AppColors.gold,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  )
                ),

                SizedBox(height: 15),

                Text(
                  'Review and change or update your info',
                  style: TextStyle(
                    color: AppColors.gold,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                
                const Text(
                  'Hello',
                  style: TextStyle(
                    color: AppColors.text,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
                
                const SizedBox(height: 10),
                
                Text(
                  fss.getUserInfo("first_name"),
                  style: const TextStyle(
                    color: AppColors.text,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25,),
            
            const Text(
              'Want to change your name?',
              style: TextStyle(
                color: AppColors.hint,
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 10,),

            Button(
              text: "Change your name",
              onTap: changeName,
            ),

            const SizedBox(height: 250),

            Button(
              text: "Back to settings page",
              onTap: back,
            ),
          ],
        ),
      ),
    );
  }
}