// ignore_for_file: prefer_const_constructors

import 'package:empire/components/app_colors.dart';
import 'package:empire/pages/home_page.dart';
import 'package:empire/pages/settings_page.dart';
import 'package:empire/pages/todo_page.dart';
import 'package:empire/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:empire/pages/fitness_page.dart';

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
    } else if (page == "todo") {
      // todo page
      pageWidget = ToDoPage();
    } else if (page == "fitness") {
      // fitness page
      pageWidget = FitnessPage();
    } else if (page == "runs") {
      // runs page
      //pageWidget = RunsPageHERE();
    } else {
      // unknown page
      pageWidget = Center();
    }

    // wallpaper selector
    BoxDecoration? wallpaper;
    FirestoreService fss = FirestoreService();
    if (fss.getUserInfo("wallpaper") is String &&
        fss.getUserInfo("wallpaper").contains(RegExp("http"))) {
      wallpaper = BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            fss.getUserInfo("wallpaper"),
          ),
          fit: BoxFit.cover,
        ),
      );
    }

    // build application widget
    return Scaffold(
      backgroundColor: AppColors.background,

      // body contains the active page
      body: Container(
        decoration: wallpaper,
        child: pageWidget,
      ),

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
            //FItness button
            SizedBox(width: 10),
            IconButton(
              onPressed: () => setState(() => page = "fitness"),
              icon: Icon(
                Icons.fitness_center,
                color: (page == "fitness" ? AppColors.text : AppColors.raised),
              ),
            ),
            SizedBox(width: 10),
            // home button
            IconButton(
              onPressed: () => setState(() => page = "home"),
              icon: Icon(
                Icons.home,
                color: (page == "home" ? AppColors.text : AppColors.raised),
              ),
            ),
            SizedBox(width: 10),
            // past runs button
            IconButton(
              onPressed: () => setState(() => page = "runs"),
              icon: Icon(
                Icons.directions_run,
                color: (page == "runs" ? AppColors.text : AppColors.raised),
              ),
            ),
            SizedBox(width: 10),
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
