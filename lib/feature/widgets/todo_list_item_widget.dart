import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/feature/models/todo.dart';

typedef OnTodoUpdated = Function(String description, String todoId);
typedef OnTodoDeleted = Function(String todoId);
typedef OnTodoStatusChanged = Function(bool result, String todoId);

class ToDoListItemWidget extends HookWidget {
  final Todo todo;
  final OnTodoUpdated onTodoUpdated;
  final OnTodoDeleted onTodoDeleted;
  final OnTodoStatusChanged onTodoStatusChanged;
  const ToDoListItemWidget({
    super.key,
    required this.todo,
    required this.onTodoUpdated,
    required this.onTodoDeleted,
    required this.onTodoStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(todo.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        onTodoDeleted(todo.id);
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: ListTile(
        title: GestureDetector(
            onTap: () => onTodoUpdated(todo.title, todo.id),
            child: Text(todo.title)),
        trailing: GestureDetector(
          onTap: () => onTodoStatusChanged(todo.isCompleted, todo.id),
          child: Icon(
            todo.isCompleted ? Icons.circle_outlined : Icons.close,
            color: todo.isCompleted ? Colors.green : Colors.red,
          ),
        ),
      ),
    );
  }
}
