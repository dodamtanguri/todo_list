import 'package:flutter/material.dart';
import 'package:todo_list/feature/models/todo.dart';
import 'package:todo_list/feature/widgets/todo_list_item_widget.dart';

typedef OnTodoUpdated = Function(Todo);
typedef OnDelete = Function(String index);

class ToDoListWidget extends StatelessWidget {
  final List<Todo> todos;
  final OnTodoUpdated onTodoUpdated;
  final OnDelete onDelete; // 삭제 콜백 추가
  const ToDoListWidget({
    super.key,
    required this.todos,
    required this.onTodoUpdated,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return ToDoListItemWidget(
          todo: todos[index],
          onTodoUpdated: (updatedTodo) {
            onTodoUpdated(updatedTodo);
          },
          onDelete: (todoId) {
            onDelete(todoId); // 항목의 인덱스를 전달
          },
        );
      },
    );
  }
}
