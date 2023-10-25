import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_list/feature/riverpod/view_models/todo_view_model.dart';
import 'package:todo_list/feature/widgets/commons/input_bottom_sheet_widget.dart';
import 'package:todo_list/feature/widgets/commons/message_box_widget.dart';

class ToDoListItemWidget extends HookConsumerWidget {
  const ToDoListItemWidget({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosProvider);
      print('ToDoListItemWidget :*************');
    return Dismissible(
      key: ValueKey(index),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        ref.read(todosProvider.notifier).remove(index);
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
                description: todos[index].title);

            if (title == null) {
              return;
            }
            ref
                .read(todosProvider.notifier)
                .edit(todos[index].copyWith(title: title), index);
          },
          child: Text(todos[index].title!),
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
                todos[index].copyWith(isCompleted: dialogResult.value), index);
          },
          child: Icon(
            todos[index].isCompleted ? Icons.circle_outlined : Icons.close,
            color: todos[index].isCompleted ? Colors.green : Colors.red,
          ),
        ),
      ),
    );
  }
}
