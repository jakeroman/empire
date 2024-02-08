import 'package:empire/components/button.dart';
import 'package:flutter/material.dart';
import 'package:empire/pages/settings_page.dart';

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
    //FirebaseAuth.instance.signOut();
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
                  onTap: back,
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