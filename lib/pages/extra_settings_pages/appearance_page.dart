import 'package:empire/components/button.dart';
import 'package:flutter/material.dart';
import 'package:empire/pages/settings_page.dart';

class AppearancePage extends StatefulWidget{
  const AppearancePage({super.key});

  @override
  State<AppearancePage> createState() => _AppearancePageState();
}

class _AppearancePageState extends State<AppearancePage> {

  back() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingsPage()),
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
              'Appearance Page!'
            ),
            Button(
              text: "Back",
              onTap: back,
            ),
          ],
        ),
      ),
    );
  }
}