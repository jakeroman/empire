// ignore_for_file: prefer_const_constructors

import 'package:empire/components/app_colors.dart';
import 'package:empire/services/firestore_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    FirestoreService fss = FirestoreService();
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // welcome user
            Text(
              'Welcome to your Empire',
              style: TextStyle(color: AppColors.hint, fontSize: 16),
            ),
            Text(
              fss.getUserInfo("first_name"),
              style: TextStyle(color: AppColors.text, fontSize: 28),
            ),

            SizedBox(height: 100), // padding

            // to do list overview
            Text(
              'Alert Center',
              style: TextStyle(color: AppColors.hint, fontSize: 16),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(25),
              margin: EdgeInsets.symmetric(horizontal: 50),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.raised,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    "No upcoming tasks",
                    style: TextStyle(color: AppColors.text, fontSize: 16),
                  ),
                ],
              ),
            ),

            SizedBox(height: 140), // padding
          ],
        ),
      ),
    );
  }
}
