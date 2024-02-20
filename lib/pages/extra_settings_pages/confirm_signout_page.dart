import 'package:empire/components/button.dart';
import 'package:empire/pages/auth_page.dart';
import 'package:empire/pages/extra_auth_pages/login_page.dart';
import 'package:empire/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:empire/pages/settings_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:empire/components/app_colors.dart';
import 'package:empire/pages/navigation_page.dart';

class ConfirmSignoutPage extends StatefulWidget {
  const ConfirmSignoutPage({super.key});

  @override
  State<ConfirmSignoutPage> createState() => _ConfirmSignoutPageState();
}

class _ConfirmSignoutPageState extends State<ConfirmSignoutPage> {
  back() {
    Navigator.pop(context);
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();

    // de-initialize firestore service
    FirestoreService fss = FirestoreService();
    fss.deinitializeFirestoreService();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AuthPage()),
    );
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
            const Text('Sign Out Page!',
                style: TextStyle(
                  color: AppColors.text,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                )),
            const Text('Are you sure you want to sign out?',
                style: TextStyle(
                  color: AppColors.text,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                  text: "Yes",
                  onTap: signUserOut,
                ),
                Button(
                  text: "No",
                  onTap: back,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
