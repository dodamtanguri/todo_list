import 'package:flutter/material.dart';
import 'package:todo_list/feature/models/todo.dart';
import 'package:todo_list/feature/widgets/todo_list_item_widget.dart';

typedef OnTodoUpdated = Function(String title, String todoId);
typedef OnTodoDeleted = Function(String index);
typedef OnTodoStatusChanged = Function(bool result, String todoId);

class ToDoListWidget extends StatelessWidget {
  final List<Todo> todos;
  final OnTodoUpdated onTodoUpdated;
  final OnTodoDeleted onTodoDeleted;
  final OnTodoStatusChanged onTodoStatusChanged;
  const ToDoListWidget({
    super.key,
    required this.todos,
    required this.onTodoUpdated,
    required this.onTodoDeleted,
    required this.onTodoStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return ToDoListItemWidget(
          todo: todos[index],
          onTodoUpdated: (title, id) => onTodoUpdated(title, id),
          onTodoDeleted: (todoId) => onTodoDeleted(todoId),
          onTodoStatusChanged: (result, todoId) =>
              onTodoStatusChanged(result, todoId),
        );
      },
    );
  }
}
