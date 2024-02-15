// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:empire/components/app_colors.dart';
import 'package:empire/components/my_button.dart';
import 'package:empire/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PasswordReset extends StatefulWidget {
  final Function()? onTap;

  PasswordReset({super.key, required this.onTap});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  // controllers
  final emailController = TextEditingController();

  // sign user up method
  void sendResetEmail() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });

    // do signup
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'invalid-credential') {
        // User credentials were incorrect
        print("displaying message");
        showErrorMessage("Invalid Username/Password");
      }
    }
  }

  // wrong credential popup
  void showErrorMessage(String msg) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(title: Text(msg));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // logo
              Text(
                "Empire",
                style: TextStyle(
                    color: AppColors.gold,
                    fontSize: 60,
                    fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 50),

              // welcome back
              Text('Password Reset',
                  style: TextStyle(color: AppColors.text, fontSize: 16)),

              SizedBox(height: 25),

              // username text field
              MyTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
              ),

              SizedBox(height: 25),

              // password reset button
              MyButton(onTap: sendResetEmail, text: "Send Reset Email"),

              SizedBox(height: 25),

              // not a member? register
              SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Remember your password?',
                    style: TextStyle(color: AppColors.hint),
                  ),
                  SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Return to login",
                      style: TextStyle(
                          color: AppColors.gold, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
