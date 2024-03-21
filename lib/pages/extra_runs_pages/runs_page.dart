import 'package:empire/components/app_colors.dart';
import 'package:flutter/material.dart';

class RunsPage extends StatefulWidget {
  const RunsPage({super.key});

  @override
  State<RunsPage> createState() => _RunsPageState();
}

class _RunsPageState extends State<RunsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: null,
        backgroundColor: AppColors.gold,
        title: const Center(
          child: Text(
            'Runs',
            style: TextStyle(color: AppColors.text),
          ),
        ),
      ),

      // Button to start a run



      // List view of past runs
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    // children: [
                    //               // List veiw
                    // ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}