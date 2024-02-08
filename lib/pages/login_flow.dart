import 'package:empire/pages/password_reset.dart';
import 'package:empire/pages/login_page.dart';
import 'package:empire/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginFlow extends StatefulWidget {
  const LoginFlow({super.key});

  @override
  State<LoginFlow> createState() => _LoginFlowState();
}

class _LoginFlowState extends State<LoginFlow> {
  bool showLoginPage = true; // true = login, false = register
  bool forgotPasswordPage = false;

  // page toggle
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  // forgot password toggle
  void toggleForgotPassword() {
    setState(() {
      forgotPasswordPage = !forgotPasswordPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    // route user to login page or register page
    if (showLoginPage) {
      // user is logging in
      if (!forgotPasswordPage) {
        // continue to login page
        return LoginPage(
            togglePage: togglePages, forgotPassword: toggleForgotPassword);
      } else {
        // display password reset page
        return PasswordReset(onTap: toggleForgotPassword);
      }
    } else {
      // user is registering
      return RegisterPage(onTap: togglePages);
    }
  }
}
