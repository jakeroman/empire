class Run {
  DateTime date;
  int duration;
  int steps;
  double distance;

  Run({
    required this.date,
    required this.duration,
    required this.steps,
    required this.distance,
  });

  // json conversion
  factory Run.fromJson(Map<String, dynamic> json) {
    return Run(
      date: DateTime.fromMillisecondsSinceEpoch(json["date"]),
      duration: json["duration"],
      steps: json["steps"],
      distance: json["distance"],
    );
  }
  static Map<String, dynamic> toJson(Run run) {
    return {
      'date': run.date.millisecondsSinceEpoch,
      'duration': run.duration,
      'steps': run.steps,
      'distance': run.distance,
    };
  }
}
