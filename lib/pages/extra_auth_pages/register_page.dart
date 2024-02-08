// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:empire/components/app_colors.dart';
import 'package:empire/components/my_button.dart';
import 'package:empire/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign user up method
  void signUserUp() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });

    // do signup
    try {
      // check if passwords match
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        // pop loading circle
        Navigator.pop(context);
      } else {
        // show error message for mismatched passwords
        Navigator.pop(context);
        showErrorMessage("Passwords don't match");
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'invalid-credential') {
        // User credentials were incorrect
        print("displaying message");
        showErrorMessage("Invalid Email/Password");
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
              SizedBox(height: 25),

              // logo
              Icon(Icons.lock, size: 100, color: AppColors.hint),

              SizedBox(height: 25),

              // welcome back
              Text('Let\'s create an account!',
                  style: TextStyle(color: AppColors.text, fontSize: 16)),

              SizedBox(height: 25),

              // username text field
              MyTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: false,
              ),

              SizedBox(height: 10),

              // password field
              MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),

              SizedBox(height: 10),

              // confirm password field
              MyTextField(
                controller: confirmPasswordController,
                hintText: "Confirm Password",
                obscureText: true,
              ),

              SizedBox(height: 25),

              // sign up btton
              MyButton(onTap: signUserUp, text: "Sign Up"),

              SizedBox(height: 25),

              // not a member? register
              SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: AppColors.hint,
                    ),
                  ),
                  SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Login now",
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
