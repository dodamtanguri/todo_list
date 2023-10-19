import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/feature/models/todo.dart';

typedef OnClickChangeState = Function(Todo);

class ToDoDialogWidget extends HookWidget {
  const ToDoDialogWidget({required this.todo, super.key});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    final updateTodoState = useState<Todo>(todo);

    return AlertDialog(
      title: const Text('TODO 상태 변경'),
      content: const Text('TODO 상태를 변경해주세요'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop,
          child: const Text('완료'),
        ),
      ],
    );
  }
}
