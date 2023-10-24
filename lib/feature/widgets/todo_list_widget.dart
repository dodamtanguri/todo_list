import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/feature/models/todo.dart';
import 'package:todo_list/feature/widgets/todo_list_item_widget.dart';

class ToDoListWidget extends HookWidget {
  final List<Todo> todos;
  final OnTodoUpdated onTodoUpdated;
  final OnTodoDeleted onTodoDeleted;

  const ToDoListWidget({
    super.key,
    required this.todos,
    required this.onTodoUpdated,
    required this.onTodoDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return ToDoListItemWidget(
          todo: todos[index],
          index: index,
          onTodoUpdated: (todo, index) => onTodoUpdated(todo, index),
          onTodoDeleted: (index) => onTodoDeleted(index),

        );
      },
    );
  }
}
