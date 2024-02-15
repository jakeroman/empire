// Dart Core Imports
import 'package:flutter/material.dart';

// Firebase Imports
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Pages
import 'package:empire/pages/auth_page.dart';

void main() async {
  // Firebase Initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Run Application
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Launch auth flow widget
    return const MaterialApp(
      home: AuthPage(),
    );
  }
}
