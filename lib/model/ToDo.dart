class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Temp Task 1', isDone: true),
      ToDo(id: '02', todoText: 'Temp Task 2', isDone: false),
      ToDo(id: '03', todoText: 'finish the to-do page', isDone: false),
    ];
  }

  // json conversion
  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
        id: json["id"], todoText: json["todoText"], isDone: json["isDone"]);
  }
  static Map<String, dynamic> toJson(ToDo task) {
    return {'id': task.id, 'todoText': task.todoText, 'isDone': task.isDone};
  }
}
