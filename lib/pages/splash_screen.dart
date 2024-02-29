// ignore_for_file: prefer_const_constructors

import 'package:empire/components/app_colors.dart';
import 'package:empire/components/my_button.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  final Function()? switchToLogin;

  const SplashScreen({super.key, this.switchToLogin});

  @override
  Widget build(BuildContext context) {
    //Switching to login page
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.gold, AppColors.background],
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // child: RaisedButton(
          //   child: Text("Enter Arena"),
          //   Color(Colors.black),
          //   onPressed(){
          //     Navigator.push(context, MertialPageRoute(builder: (context)=>LoginPage()));
          //   }
          // )
          children: [
            SizedBox(height: 200),
            Text(
              "Welcome to",
              style: TextStyle(
                fontStyle: FontStyle.normal,
                color: AppColors.text,
                fontSize: 40,
              ),
            ),
            Text(
              "Empire",
              style: TextStyle(
                fontStyle: FontStyle.normal,
                color: AppColors.gold,
                fontSize: 70,
              ),
            ),
            SizedBox(height: 200),
            MyButton(onTap: switchToLogin, text: "Enter your Empire")
          ],
        ),
      ),
    );
  }
}
