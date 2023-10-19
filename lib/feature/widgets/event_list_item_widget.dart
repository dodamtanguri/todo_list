import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/feature/models/todo.dart';
import 'package:todo_list/feature/widgets/todo_dialog_widget.dart';

typedef OnClickTodoStateButton = Function(Todo);

class EventListItemWidget extends HookWidget {
  final Todo todo;

  const EventListItemWidget({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final updateTodo = useState<Todo>(todo);
    return ListTile(
      title: Text(todo.title),
      trailing: GestureDetector(
        onTap: () async {
          DialogResult? result =
              await ToDoDialogWidget.show(context, message: '변경하시겠습니까?');
          updateTodo.value =
              updateTodo.value.copyWith(isCompleted: result!.value);
        },
        child: Icon(
          updateTodo.value.isCompleted ? Icons.check_circle : Icons.cancel,
          color: updateTodo.value.isCompleted ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
