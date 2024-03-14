import 'package:bottom_picker/bottom_picker.dart';
import 'package:empire/components/app_colors.dart';
import 'package:empire/components/todo_item.dart';
import 'package:empire/model/ToDo.dart';
import 'package:empire/services/todo_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  final todosList =
      TodoService.getToDoList(); // request todo status from firebase
  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: null,
        backgroundColor: AppColors.gold,
        title: const Center(
          child: Text(
            'Task List',
            style: TextStyle(color: AppColors.text),
          ),
        ),
      ),
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
                    children: [
                      for (ToDo todo in todosList)
                        ToDoItem(
                          todo: todo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                // Child for the text field
                Expanded(
                  child: Container(
                    margin:
                        const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.raised,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: AppColors.hint),
                        hintText: 'Add a new to-do Item',
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(color: AppColors.text),
                    ),
                  ),
                ),

                //Container for add task button
                Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      //Asks for a date input
                      _openDatePicker(context);

                      // Adds the item to the list
                      //_addToDoItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.hint,
                      minimumSize: const Size(60, 60),
                      elevation: 10,
                    ),
                    child: const Text(
                      '+',
                      style: TextStyle(
                        fontSize: 40,
                        color: AppColors.text,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _openDatePicker(BuildContext context) {
    BottomPicker.range(
      title: 'Select when you plan to finish it and when it is due.',
      dateOrder: DatePickerDateOrder.dmy,
      minFirstDate: DateTime.now(),
      minSecondDate: DateTime.now(),
      pickerTextStyle: const TextStyle(color: AppColors.text, fontSize: 12),
      titleStyle: const TextStyle(color: AppColors.text),
      onRangeDateSubmitPressed: (finishBy, dueDate) {
        _addToDoItem(_todoController.text, dueDate, finishBy);
      },
      backgroundColor: AppColors.background,
    ).show(context);
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
    TodoService.saveToDoList(todosList); // save todo change to firebase
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
    TodoService.saveToDoList(todosList); // save todo change to firebase
  }

  void _addToDoItem(String todo, DateTime date, DateTime finish) {
    setState(() {
      todosList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: todo,
          dueDate: date,
          finishBy: finish));
    });
    _todoController.clear();
    TodoService.saveToDoList(todosList); // save todo change to firebase
  }
}
