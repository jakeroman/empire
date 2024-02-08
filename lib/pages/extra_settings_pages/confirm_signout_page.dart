import 'package:empire/components/button.dart';
import 'package:empire/pages/auth_page.dart';
import 'package:empire/pages/extra_auth_pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:empire/pages/settings_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ConfirmSignoutPage extends StatefulWidget{
  const ConfirmSignoutPage({super.key});

  @override
  State<ConfirmSignoutPage> createState() => _ConfirmSignoutPageState();
}

class _ConfirmSignoutPageState extends State<ConfirmSignoutPage> {

  back() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingsPage()),
    );
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AuthPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sign Out Page!'
            ),
            const Text(
              'Are you sure you want to sign out?'
            ),
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