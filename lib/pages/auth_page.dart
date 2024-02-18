//import 'package:authenticationlab/pages/home_page.dart';
import 'package:empire/pages/extra_auth_pages/login_flow.dart';
import 'package:empire/pages/loading_page.dart';
import 'package:empire/pages/navigation_page.dart';
import 'package:empire/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  // main logic
  @override
  Widget build(BuildContext context) {
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
            return const LoginFlow();
          }
        },
      ),
    );
  }
}
