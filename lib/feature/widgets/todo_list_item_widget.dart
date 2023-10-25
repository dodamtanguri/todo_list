import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/feature/models/todo.dart';
import 'package:todo_list/feature/widgets/commons/input_bottom_sheet_widget.dart';
import 'package:todo_list/feature/widgets/commons/message_box_widget.dart';

typedef OnTodoUpdated = Function(Todo todo, int index);
typedef OnTodoDeleted = Function(int index);

class ToDoListItemWidget extends HookWidget {
    const ToDoListItemWidget({
    super.key,
    required this.index,
    required this.todo,
    required this.onTodoUpdated,
    required this.onTodoDeleted,
  });

  final Todo todo;
  final int index;
  final OnTodoUpdated onTodoUpdated;
  final OnTodoDeleted onTodoDeleted;

  @override
  Widget build(BuildContext context) {
    print('######################ToDoListItemWidget HOOK #######################');
    return Dismissible(
      key: ValueKey(todo.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        onTodoDeleted(index);
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: ListTile(
        title: GestureDetector(
            //onItemSelected
            onTap: () async {
              String? title = await InputBottomSheetWidget.show(context,
                  description: todo.title);

              if (title == null) {
                return;
              }
              onTodoUpdated(todo.copyWith(title: title),index);
            },
            child: Text(todo.title!)),
        trailing: GestureDetector(
          onTap: () async {
            DialogResult? dialogResult = await MessageBoxWidget.show(context,
                message: '변경하시겠습니까?',
                positiveLabel: '완료',
                negativeLabel: '미완료');

            if (dialogResult == null) {
              return;
            }
            onTodoUpdated(todo.copyWith(isCompleted: dialogResult.value,), index);
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
