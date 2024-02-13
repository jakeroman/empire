//import 'package:authenticationlab/pages/home_page.dart';
import 'package:empire/pages/extra_auth_pages/login_flow.dart';
import 'package:empire/pages/navigation_page.dart';
import 'package:empire/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              // user logged in
              if (snapshot.hasData) {
                return const NavigationPage();
              }

              // user not logged in
              else {
                return const LoginFlow();
              }
            }));
  }
}
