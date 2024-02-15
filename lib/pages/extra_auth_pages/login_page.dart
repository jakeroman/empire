// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:empire/components/app_colors.dart';
import 'package:empire/components/my_button.dart';
import 'package:empire/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()? togglePage;
  final Function()? forgotPassword;

  LoginPage(
      {super.key, required this.togglePage, required this.forgotPassword});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    // show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });

    // do signin
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      // pop loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'invalid-credential') {
        // User credentials were incorrect
        print("displaying message");
        wrongCredentialMessage();
      }
    }
  }

  // wrong credential popup
  void wrongCredentialMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(title: Text("Incorrect Email/Password"));
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

              SizedBox(height: 25),

              // welcome back
              Text('Welcome back, you\'ve been missed!',
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

              // forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: widget.forgotPassword,
                      child: Text("Forgot Password?",
                          style: TextStyle(color: AppColors.hint)),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25),

              // sign in btton
              MyButton(onTap: signUserIn, text: "Sign In"),

              SizedBox(height: 25),

              // not a member? register
              SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(
                      color: AppColors.hint,
                    ),
                  ),
                  SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.togglePage,
                    child: Text("Register now",
                        style: TextStyle(
                            color: AppColors.gold,
                            fontWeight: FontWeight.bold)),
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
