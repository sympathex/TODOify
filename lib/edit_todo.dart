import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'models/todo.dart';
//import 'add.dart';

void editTodo(
  BuildContext context,
  int index,
  String newTitle,
  String newDescription) {

    final box = Hive.box<Todo>('todosBox');
    final todo = box.getAt(index);    

    if (todo == null) return;

    // Prevent empty title only
    if (newTitle.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Title cannot be empty!')),
      );
      return;
    }

    // Create a new todo with the updated values (allowing empty or null description) 
    final updatedTodo = Todo(
      title: newTitle.trim(),
      description: 
        newDescription.trim().isEmpty ? null : newDescription.trim(),
      isDone: todo.isDone, // keep the original completion state
    );

    // Replace the old todo at the same index
    box.putAt(index, updatedTodo);

    Navigator.of(context).pop();   // closes the dialog
  }