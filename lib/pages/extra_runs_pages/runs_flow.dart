import 'package:empire/pages/extra_runs_pages/runs_page.dart';
import 'package:empire/pages/extra_runs_pages/current_run_page.dart';
import 'package:flutter/material.dart';

class RunsFlow extends StatefulWidget {
  const RunsFlow({super.key});

  @override
  State<RunsFlow> createState() => _RunsFlowState();
}

class _RunsFlowState extends State<RunsFlow> {
  bool showRunsPage = true; // true = runs page, false = current run page

  // page toggle
  void togglePages() {
    setState(() {
      showRunsPage = !showRunsPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    // route user to Runs page or Current Run page
    if(showRunsPage){
      return const RunsPage();
    }else{
      return const CurrentRunPage();
    }
  }
}
