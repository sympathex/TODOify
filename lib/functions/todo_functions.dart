import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list/models/todo.dart';

class TodoFunctions {
  //  Add a new todo to Hive 
  static void addTodo(BuildContext context, String title, String description) {
    // Validate title first
    if (title.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Title cannot be empty!')),
      );
      return;
    }

    // Allow optional description
    final todo = Todo(title: title.trim(), description: description.trim().isEmpty ? null : description.trim());
    Hive.box<Todo>('todosBox').add(todo);

    Navigator.of(context).pop();
  }

  // delete a todo at index
  static void deleteTodoAt(int index){
    Hive.box<Todo>('todosBox').deleteAt(index);
  }
}
 