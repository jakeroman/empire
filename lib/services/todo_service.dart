import "package:empire/model/ToDo.dart";
import "package:empire/services/firestore_service.dart";

import "dart:convert";

class TodoService {
  static List<ToDo> getToDoList() {
    // request stored tasks from firestore service
    FirestoreService fss = FirestoreService();
    String storedTaskData = fss.getUserInfo("todo_tasks");
    if (storedTaskData == "Data Error") {
      // handle error
      print("Todo Service: Task data error");
      return [];
    }

    // reconstruct to do data structure
    var decodedJson = jsonDecode(storedTaskData);
    List<Map<String, dynamic>> storedTasks =
        List<Map<String, dynamic>>.from(decodedJson);
    List<ToDo> retrieved = [];
    for (int i = 0; i < storedTasks.length; i++) {
      ToDo task = ToDo.fromJson(storedTasks[i]);
      retrieved.add(task);
    }

    // return reconstructed task list
    return retrieved;
  }

  static void saveToDoList(List<ToDo> list) {
    // construct json
    List<Map<String, dynamic>> savedTasks = List.filled(list.length, {});
    for (int i = 0; i < list.length; i++) {
      savedTasks[i] = ToDo.toJson(list[i]);
    }
    String savedTaskData = jsonEncode(savedTasks);

    // update firestore
    FirestoreService fss = FirestoreService();
    fss.updateUserInfo("todo_tasks", savedTaskData);
  }
}
