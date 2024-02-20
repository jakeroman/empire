import 'package:empire/components/app_colors.dart';
import 'package:empire/model/ToDo.dart';
import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {

  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  const ToDoItem({super.key, required this.todo, required this.onToDoChanged, required this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: (){
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: AppColors.raised,
        leading: Icon(
          todo.isDone? Icons.check_box : Icons.check_box_outline_blank, 
          color: AppColors.hint,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            color: AppColors.text, 
            fontSize: 16, 
            decoration: todo.isDone? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: AppColors.error,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: AppColors.text,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: (){
              onDeleteItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}