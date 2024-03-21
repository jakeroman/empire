import 'package:empire/components/app_colors.dart';
import 'package:flutter/material.dart';

class CurrentRunPage extends StatefulWidget {
  const CurrentRunPage({super.key});

  @override
  State<CurrentRunPage> createState() => _CurrentRunPageState();
}

class _CurrentRunPageState extends State<CurrentRunPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: null,
        backgroundColor: AppColors.gold,
        title: const Center(
          child: Text(
            'Current Run',
            style: TextStyle(color: AppColors.text),
          ),
        ),
      ),

    );
  }

}