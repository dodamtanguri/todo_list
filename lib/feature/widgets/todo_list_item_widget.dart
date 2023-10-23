import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/feature/models/todo.dart';
import 'package:todo_list/feature/widgets/commons/input_bottom_sheet_widget.dart';
import 'package:todo_list/feature/widgets/commons/message_box_widget.dart';


typedef OnTodoUpdated = Function(Todo);
typedef OnDelete = Function(String todoId);

class ToDoListItemWidget extends HookWidget {
  final Todo todo;
  final OnTodoUpdated onTodoUpdated;
  final OnDelete onDelete;
  const ToDoListItemWidget({
    super.key,
    required this.todo,
    required this.onTodoUpdated,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    print('ToDoListItemWidget');
    return Dismissible(
      key: ValueKey(todo.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        onDelete(todo.id);
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: ListTile(
        title: GestureDetector(
            onTap: () async {
              String? title = await InputBottomSheetWidget.show(context,
                  description: todo.title);
              onTodoUpdated(todo.copyWith(title: title ?? todo.title));
            },
            child: Text(todo.title)),
        trailing: GestureDetector(
          onTap: () async {
            DialogResult? result = await MessageBoxWidget.show(context,
                message: '변경하시겠습니까?',
                positiveLabel: '완료',
                negativeLabel: '미완료');
            Todo updatedTodo =
                todo.copyWith(isCompleted: result?.value ?? todo.isCompleted);
            onTodoUpdated(updatedTodo);
          },
          child: Icon(
            todo.isCompleted ? Icons.circle_outlined : Icons.close,
            color: todo.isCompleted ? Colors.green : Colors.red,
          ),
        ),
      ),
    );
  }
}
