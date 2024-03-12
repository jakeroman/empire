import 'package:empire/pages/extra_auth_pages/login_flow.dart';
import 'package:empire/pages/splash_screen.dart';
import 'package:empire/pages/first_register_page.dart';
import 'package:empire/pages/loading_page.dart';
import 'package:empire/pages/navigation_page.dart';
import 'package:empire/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthPage extends StatefulWidget {
  static const currentUserInfoVersion = 1;

  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool splashScreen = true;

  // main logic
  @override
  Widget build(BuildContext context) {
    void switchToLogin() {
      setState(() {
        splashScreen = false;
      });
    }

    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user logged in
          if (snapshot.hasData) {
            // create firebase userdata
            final FirestoreService fss = FirestoreService();
            fss.initializeFirestoreService();

            // return a futurebuilder to direct user either to navigation page or a loading screen until the cache is loaded
            return FutureBuilder(
              future: fss.waitForCache(),
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                // check if cache is loaded
                if (snapshot.connectionState == ConnectionState.done) {
                  // update user info if neccessary
                  dynamic userInfoVersion = fss.getUserInfo("info_version");
                  if (userInfoVersion is String) {
                    userInfoVersion = 0;
                  }
                  if (userInfoVersion < AuthPage.currentUserInfoVersion) {
                    return const FirstRegisterPage();
                  }

                  // proceed to main navigation
                  return const NavigationPage();
                } else {
                  // return a loading screen
                  return const LoadingPage(); // (i'm using splash screen temporarily)
                }
              },
            );
          }

          // user not logged in
          else {
            if (!splashScreen) {
              return const LoginFlow();
            } else {
              return SplashScreen(switchToLogin: switchToLogin);
            }
          }
        },
      ),
    );
  }
}
