import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/feature/models/todo.dart';

class EventListItemWidget extends StatelessWidget {
  final Todo todo;

  const EventListItemWidget({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      trailing: Icon(
        todo.isCompleted ? Icons.check_circle : Icons.cancel,
        color: todo.isCompleted ? Colors.green : Colors.red,
      ),
    );
  }
}