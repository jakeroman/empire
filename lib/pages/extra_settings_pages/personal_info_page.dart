import 'package:empire/components/button.dart';
import 'package:flutter/material.dart';
import 'package:empire/pages/settings_page.dart';

class PersonalInfoPage extends StatefulWidget{
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {

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
              'Personal Info Page!'
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