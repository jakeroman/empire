import 'package:empire/model/Run.dart';
import 'package:empire/services/firestore_service.dart';
import 'package:pedometer/pedometer.dart';

import "dart:convert";

class FitnessService {
  // Force a single instance of FitnessService to avoid desynchronization
  FitnessService._privateConstructor();
  static final FitnessService _instance = FitnessService._privateConstructor();

  factory FitnessService() {
    // Return the single instance rather than creating a new one
    return _instance;
  }

  // Service variables
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  bool initialized = false;

  // Activity variables
  int steps = -1;
  String status = "N/A";
  DateTime timeStamp = DateTime.now();

  // Stream event handling
  void onStepCount(StepCount event) {
    steps = event.steps;
    timeStamp = event.timeStamp;
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    status = event.status;
    timeStamp = event.timeStamp;
  }

  // Pedometer error handling
  void onStepCountError(dynamic error) {
    print("FITNESS: Error occurred in step count stream: $error");
  }

  void onPedestrianStatusError(dynamic error) {
    print("FITNESS: Error occurred in pedestrian status stream: $error");
  }

  // Initialization method
  Future<void> initPlatformState() async {
    // Prevent double initialization
    if (initialized) {
      return;
    }
    initialized = true;

    // Stream creation
    _pedestrianStatusStream =
        Pedometer.pedestrianStatusStream.handleError(onPedestrianStatusError);
    _stepCountStream = Pedometer.stepCountStream.handleError(onStepCountError);

    // Connect listeners
    _stepCountStream.listen(onStepCount);
    _pedestrianStatusStream.listen(onPedestrianStatusChanged);

    // Load runs from database
    FirestoreService fss = FirestoreService();
    String storedRunData = fss.getUserInfo("past_runs");
    if (storedRunData == "Data Error") {
      print("Fitness Service: Run data error");
    } else {
      var decodedJson = jsonDecode(storedRunData);
      List<Map<String, dynamic>> storedRuns =
          List<Map<String, dynamic>>.from(decodedJson);
      for (int i = 0; i < storedRuns.length; i++) {
        pastRuns.add(Run.fromJson(storedRuns[i]));
      }
    }
  }

  // Run tracking functionality
  List<Run> pastRuns = List.empty();
  bool runActive = false;
  DateTime runStartTime = DateTime.now();
  int runStartSteps = 0;

  bool getRunStatus() {
    // Returns true if there is an active run
    return runActive;
  }

  void startRun() {
    // Starts a run if there isn't one active already
    if (!runActive) {
      runActive = true;
    }
  }

  void stopRun() {
    // Stops a run if there is one active, and saves it to database
    if (runActive) {
      runActive = false;
      pastRuns.add(
        Run(
          date: runStartTime,
          duration: getRunTime(),
          steps: getRunSteps(),
          distance: getRunDist(),
        ),
      );

      saveRuns();
    }
  }

  int getRunTime() {
    // Returns the number of seconds we have been running
    return ((DateTime.now().millisecondsSinceEpoch -
                runStartTime.millisecondsSinceEpoch) /
            1000)
        .floor();
  }

  int getRunSteps() {
    // Returns the number of steps we have taken in this run
    return steps - runStartSteps;
  }

  double getRunDist() {
    // Return the (estimated) distance we have run in miles
    return getRunSteps() / 2000;
  }

  void saveRuns() {
    // construct json
    List<Map<String, dynamic>> savedRuns = List.filled(pastRuns.length, {});
    for (int i = 0; i < pastRuns.length; i++) {
      savedRuns[i] = Run.toJson(pastRuns[i]);
    }
    String savedRunData = jsonEncode(savedRuns);

    // update firestore
    FirestoreService fss = FirestoreService();
    fss.updateUserInfo("past_runs", savedRunData);
  }
}
