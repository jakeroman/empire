// ignore_for_file: prefer_const_constructors
import 'package:empire/components/app_colors.dart';
import 'package:empire/pages/todo_page.dart';
import 'package:empire/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:empire/services/todo_service.dart';
import "package:empire/model/ToDo.dart";
import 'package:empire/components/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todosList = TodoService.getToDoList();

  String tasksAvailable() {
    FirestoreService fss = FirestoreService();
    if (TodoService.getToDoList().isEmpty) {
      return "No tasks available";
    } else {
      return "Upcoming tasks:";
    }
  }

  @override
  Widget build(BuildContext context) {
    FirestoreService fss = FirestoreService();
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),

            // welcome user
            Text(
              'Welcome to your Empire',
              style: TextStyle(color: AppColors.gold, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              fss.getUserInfo("first_name"),
              style: TextStyle(color: AppColors.text, fontSize: 32),
            ),

            SizedBox(height: 55), // padding

            // to do list overview
            Text(
              'Alert Center',
              style: TextStyle(color: AppColors.gold, fontSize: 22, fontWeight: FontWeight.bold),
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
                    tasksAvailable(),
                    style: TextStyle(color: AppColors.text, fontSize: 18),
                  ),
                  SizedBox(height: 15),
                  for (ToDo todo in todosList)
                    if (todo.dueDate.day == DateTime.now().day)
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.hint,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              todo.todoText!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.text,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
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
