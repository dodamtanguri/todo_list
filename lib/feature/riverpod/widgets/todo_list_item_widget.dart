import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_list/feature/models/todo.dart';
import 'package:todo_list/feature/riverpod/view_models/todo_view_model.dart';
import 'package:todo_list/feature/widgets/commons/input_bottom_sheet_widget.dart';
import 'package:todo_list/feature/widgets/commons/message_box_widget.dart';

class ToDoListItemWidget extends HookConsumerWidget {
  const ToDoListItemWidget(
      {super.key,
      required this.todo,
      required this.todoIndex,
      required this.selectDate});
  final Todo todo;
  final int todoIndex;
  final DateTime selectDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('ToDoListItemWidget :*************');

    // useEffect(() {
    //   print('****************index 값 확인***************** $todoIndex');
    //   print('-------------------- $todo');
    //   return null;
    // }, [todo]);

    return Dismissible(
      key: ValueKey(todo.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        ref.read(todosProvider.notifier).remove(selectDate, todoIndex);
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
            if (title == null) {
              return;
            }
            ref
                .read(todosProvider.notifier)
                .edit(todo.copyWith(title: title), todoIndex, selectDate);
          },
          child: Text(todo.title!),
        ),
        trailing: GestureDetector(
          onTap: () async {
            DialogResult? dialogResult = await MessageBoxWidget.show(context,
                message: '변경하시겠습니까?',
                positiveLabel: '완료',
                negativeLabel: '미완료');

            if (dialogResult == null) {
              return;
            }

            ref.read(todosProvider.notifier).edit(
                todo.copyWith(isCompleted: dialogResult.value),
                todoIndex,
                selectDate);
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
