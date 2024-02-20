// ignore_for_file: prefer_const_constructors

import 'package:empire/components/app_colors.dart';
import 'package:empire/pages/home_page.dart';
import 'package:empire/pages/settings_page.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  // buttons
  void onPressed() {}

  // page switching
  String page = "home";
  Widget pageWidget = Center();

  // application container
  @override
  Widget build(BuildContext context) {
    // prepare page widget
    if (page == "home") {
      // home page
      pageWidget = HomePage();
    } else if (page == "settings") {
      // settings page
      pageWidget = SettingsPage();
    } else {
      // unknown page
      pageWidget = Center();
    }

    // build application widget
    return Scaffold(
      backgroundColor: AppColors.background,

      // body contains the active page
      body: SafeArea(child: pageWidget),

      // navigation bar
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: AppColors.gold,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // to-do list button
            IconButton(
              onPressed: () => setState(() => page = "todo"),
              icon: Icon(
                Icons.today,
                color: (page == "todo" ? AppColors.text : AppColors.raised),
              ),
            ),
            SizedBox(width: 20),
            // home button
            IconButton(
              onPressed: () => setState(() => page = "home"),
              icon: Icon(
                Icons.home,
                color: (page == "home" ? AppColors.text : AppColors.raised),
              ),
            ),
            SizedBox(width: 20),
            // settings button
            IconButton(
              onPressed: () => setState(() => page = "settings"),
              icon: Icon(
                Icons.settings,
                color: (page == "settings" ? AppColors.text : AppColors.raised),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
