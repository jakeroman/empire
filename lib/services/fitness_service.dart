import 'package:pedometer/pedometer.dart';

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
  }
}
