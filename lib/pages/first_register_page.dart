import 'package:empire/components/app_colors.dart';
import 'package:empire/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:empire/components/button.dart';
import 'package:empire/components/my_textfield.dart';

class FirstRegisterPage extends StatefulWidget {
  const FirstRegisterPage({super.key});

  @override
  State<FirstRegisterPage> createState() => _FirstRegisterPageState();
}

class _FirstRegisterPageState extends State<FirstRegisterPage> {
  // controllers     // I dont exactly know how to use these/what they are exactly for/do but I added them anyway for now
  final firstNameController = TextEditingController();

  // More controllers to come soon(TM)

  // Method to push page
  toHomePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),

              const Text(
                'Hello! Welcome to Empire!',
                style: TextStyle(
                  fontSize: 30,
                  color: AppColors.gold,
                  fontWeight: FontWeight.w900
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Lets get you started.',
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.gold,
                  fontWeight: FontWeight.bold
                ),
              ),

              const Text(
                'First lets set up some basic information.',
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.gold,
                  fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Lets start with your name!',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.hint,
                  fontWeight: FontWeight.bold,
                ),
              ),

              MyTextField(
                controller: firstNameController, 
                hintText: 'First Name', 
                obscureText: false
              ),

              const SizedBox(height: 60),

              Button(
                onTap: toHomePage,
                text: 'Continue to your Empire!'
              ),
            ]
          ),
        ),
      ),
    );
  }
}