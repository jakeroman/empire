import 'package:flutter/material.dart';
import 'package:empire/components/app_colors.dart';

void main() {
  runApp(FitnessPage());
}

class Exercise {
  final String name;
  final int sets;
  final int reps;

  Exercise(this.name, this.sets, this.reps);
}

class WorkoutDay {
  final String day;
  final List<Exercise> exercises;

  WorkoutDay(this.day, this.exercises);
}

class FitnessPage extends StatelessWidget {
  final List<WorkoutDay> workoutSchedule = [
    WorkoutDay(
      "Monday",
      [
        Exercise("Bench Press", 3, 10),
        Exercise("Triceps Pushdowns", 3, 12),
      ],
    ),
    WorkoutDay(
      "Tuesday",
      [
        Exercise("Pull-ups", 3, asManyRepsAsPossible),
        Exercise("Bicep Curls", 3, 12),
      ],
    ),
    WorkoutDay(
      "Wednesday",
      [
        Exercise("Squats", 3, 10),
        Exercise("Lunges", 3, 15),
      ],
    ),
    WorkoutDay(
      "Thursday",
      [
        Exercise("Military Press", 3, 8),
        Exercise("Plank", 3, 60), // Time in seconds
      ],
    ),
    WorkoutDay("Friday", [Exercise("Rest Day", 0, 0)]),
    WorkoutDay("Saturday", [Exercise("Cardio", 1, 120)]), // Time in minutes
    WorkoutDay("Sunday", [Exercise("Rest Day", 0, 0)]),
  ];

  // Added helper constant for "as many reps as possible"
  static const int asManyRepsAsPossible = -1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text('Fitness Planner'),
          backgroundColor: AppColors.gold,
        ),
        body: ListView.builder(
          itemCount: workoutSchedule.length,
          itemBuilder: (context, index) {
            final workoutDay = workoutSchedule[index];
            return ListTile(
              title: Text(
                  style: TextStyle(color: AppColors.gold, fontSize: 16),
                  workoutDay.day),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: workoutDay.exercises.map((exercise) {
                  // Corrected line: convert String to Exercise object
                  return Text(
                    style: TextStyle(
                        color: const Color.fromARGB(255, 97, 148, 179),
                        fontSize: 16),
                    "${exercise.name}: ${exercise.sets} sets of ${exercise.reps == asManyRepsAsPossible ? 'AMRAP' : exercise.reps} reps",
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
