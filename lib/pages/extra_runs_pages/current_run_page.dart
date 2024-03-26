import 'package:empire/components/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:empire/components/my_button.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.directions_run,
            color: AppColors.gold,
            size: 100,
          ),
          const SizedBox(height: 20),
          const Text(
            'Run Statistics',
            style: TextStyle(
              color: AppColors.gold,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Time started: 10:30 AM',
            style: TextStyle(
              color: Color.fromARGB(255, 97, 148, 179),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Time stopped: --:-- --',
            style: TextStyle(
              color: Color.fromARGB(255, 97, 148, 179),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Distance: 3.2 km',
            style: TextStyle(
              color: Color.fromARGB(255, 97, 148, 179),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          MyButton(
            onTap: () {
              // Placeholder for end run logic
            },
            text: 'End Run',
          ),
        ],
      ),
    );
  }
}
