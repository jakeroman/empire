import 'package:empire/components/button.dart';
import 'package:empire/components/my_textfield.dart';
import 'package:empire/pages/auth_page.dart';
import 'package:empire/services/firestore_service.dart';
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
  // controller
  final wallpaperController = TextEditingController();

  back() {
    Navigator.pop(context);
    setState(() {
      
    });
  }

  void changeWallpaper() {
    FirestoreService fss = FirestoreService();
    // Update name change
    fss.updateUserInfo("wallpaper", wallpaperController.text);

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
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 15),

                Text(
                  'Appearance Page!',
                  style: TextStyle(
                    color: AppColors.gold,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  )
                ),

                SizedBox(height: 15),

                Text(
                  'Change the look of your Empire',
                  style: TextStyle(
                    color: AppColors.gold,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 35),

            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 25),
                
                Text(
                  'Set a custom wallpaper for your homepage',
                  style: TextStyle(
                    color: AppColors.text,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),

                SizedBox(height: 10),
                
                Text(
                  'Just enter a URL of an image below',
                  style: TextStyle(
                    color: AppColors.text,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            MyTextField(
              controller: wallpaperController, 
              hintText: 'Image URL', 
              obscureText: false,
            ),

            const SizedBox(height: 25,),

            Button(
              text: "Save your change",
              onTap: changeWallpaper,
            ),

            const SizedBox(height: 100),

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