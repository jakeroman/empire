import 'package:flutter/material.dart';
import 'package:empire/components/app_colors.dart';

void main() {
  runApp(FitnessPage());
}

class Exercise {
  String name;
  int sets;
  int reps;

  Exercise({required this.name, required this.sets, required this.reps});
}

class WorkoutDay {
  String day;
  List<Exercise> exercises;

  WorkoutDay({required this.day, List<Exercise>? exercises})
      : exercises = exercises != null ? exercises.toList() : [];
}

class FitnessPage extends StatefulWidget {
  @override
  _FitnessPageState createState() => _FitnessPageState();
}

class _FitnessPageState extends State<FitnessPage> {
  final List<WorkoutDay> workoutSchedule = [];

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
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.gold),
                borderRadius: BorderRadius.circular(8),
                //margin: EdgeInsets.all(8.0),
              ),
              child: ExpansionTile(
                title: Text(
                  workoutDay.day,
                  style: TextStyle(color: AppColors.gold, fontSize: 16),
                ),
                children: [
                  ...workoutDay.exercises.map(
                    (exercise) {
                      return ListTile(
                        title: Text(
                          "${exercise.name}: ${exercise.sets} sets of ${exercise.reps == asManyRepsAsPossible ? 'AMRAP' : exercise.reps} reps",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 97, 148, 179),
                            fontSize: 16,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                _editExercise(index, exercise);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                _deleteExercise(index, exercise);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                  ListTile(
                    title: TextButton(
                      child: Text(
                        'Add Exercise',
                        style: TextStyle(color: AppColors.gold),
                      ),
                      onPressed: () {
                        _addExercise(index);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addWorkoutDay,
          child: Icon(Icons.add),
          backgroundColor: AppColors.gold,
        ),
      ),
    );
  }

  void _editExercise(int dayIndex, Exercise exercise) {
    String name = exercise.name;
    int sets = exercise.sets;
    int reps = exercise.reps;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.background,
          title: Text(
            'Edit Exercise',
            style: TextStyle(color: AppColors.gold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                style:
                    TextStyle(color: const Color.fromARGB(255, 97, 148, 179)),
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter exercise name',
                  hintStyle:
                      TextStyle(color: const Color.fromARGB(255, 97, 148, 179)),
                ),
                controller: TextEditingController(text: name),
              ),
              TextField(
                style:
                    TextStyle(color: const Color.fromARGB(255, 97, 148, 179)),
                onChanged: (value) {
                  sets = int.tryParse(value) ?? 0;
                },
                decoration: InputDecoration(
                  hintText: 'Enter number of sets',
                  hintStyle:
                      TextStyle(color: const Color.fromARGB(255, 97, 148, 179)),
                ),
                controller: TextEditingController(text: sets.toString()),
              ),
              TextField(
                style:
                    TextStyle(color: const Color.fromARGB(255, 97, 148, 179)),
                onChanged: (value) {
                  reps = int.tryParse(value) ?? 0;
                },
                decoration: InputDecoration(
                  hintText: 'Enter number of reps',
                  hintStyle:
                      TextStyle(color: const Color.fromARGB(255, 97, 148, 179)),
                ),
                controller: TextEditingController(text: reps.toString()),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (name.isNotEmpty && sets > 0 && reps >= 0) {
                  setState(() {
                    workoutSchedule[dayIndex].exercises[
                            workoutSchedule[dayIndex]
                                .exercises
                                .indexOf(exercise)] =
                        Exercise(name: name, sets: sets, reps: reps);
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteExercise(int dayIndex, Exercise exercise) {
    setState(() {
      workoutSchedule[dayIndex].exercises.remove(exercise);
    });
  }

  void _addExercise(int dayIndex) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String name = '';
        int sets = 0;
        int reps = 0;
        return AlertDialog(
          backgroundColor: AppColors.background,
          title: Text(
            'Add Exercise',
            style: TextStyle(color: AppColors.gold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                style:
                    TextStyle(color: const Color.fromARGB(255, 97, 148, 179)),
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter exercise name',
                  hintStyle:
                      TextStyle(color: const Color.fromARGB(255, 97, 148, 179)),
                ),
              ),
              TextField(
                style:
                    TextStyle(color: const Color.fromARGB(255, 97, 148, 179)),
                onChanged: (value) {
                  sets = int.tryParse(value) ?? 0;
                },
                decoration: InputDecoration(
                  hintText: 'Enter number of sets',
                  hintStyle:
                      TextStyle(color: const Color.fromARGB(255, 97, 148, 179)),
                ),
              ),
              TextField(
                style:
                    TextStyle(color: const Color.fromARGB(255, 97, 148, 179)),
                onChanged: (value) {
                  reps = int.tryParse(value) ?? 0;
                },
                decoration: InputDecoration(
                  hintText: 'Enter number of reps',
                  hintStyle:
                      TextStyle(color: const Color.fromARGB(255, 97, 148, 179)),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (name.isNotEmpty && sets > 0 && reps >= 0) {
                  setState(() {
                    workoutSchedule[dayIndex].exercises.add(
                          Exercise(name: name, sets: sets, reps: reps),
                        );
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _addWorkoutDay() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String day = '';
        return AlertDialog(
          backgroundColor: AppColors.background,
          title: Text(
            'Add Workout Day',
            style: TextStyle(color: AppColors.gold),
          ),
          content: TextField(
            style: TextStyle(color: const Color.fromARGB(255, 97, 148, 179)),
            onChanged: (value) {
              day = value;
            },
            decoration: InputDecoration(
              hintText: 'Enter day',
              hintStyle:
                  TextStyle(color: const Color.fromARGB(255, 97, 148, 179)),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (day.isNotEmpty) {
                  setState(() {
                    workoutSchedule.add(WorkoutDay(day: day));
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
