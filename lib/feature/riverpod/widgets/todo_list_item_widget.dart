import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_list/feature/riverpod/view_models/todo_view_model.dart';
import 'package:todo_list/feature/widgets/commons/input_bottom_sheet_widget.dart';
import 'package:todo_list/feature/widgets/commons/message_box_widget.dart';

class ToDoListItemWidget extends HookConsumerWidget {
  const ToDoListItemWidget(
      {super.key, required this.index, required this.selectDate});

  final int index;
  final DateTime selectDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('ToDoListItemWidget :*************');
    final selectTodo = ref.watch(todosProvider)[index];
    final filterdTodos = ref
    
        .watch(todosProvider)
        .where((todo) =>
            todo.actionDate!.day == selectDate.day &&
            todo.actionDate!.month == selectDate.month &&
            todo.actionDate!.year == selectDate.year)
        .toList();

    int filterIndex =
        filterdTodos.indexWhere((element) => element.id == selectTodo.id);

    if (filterdTodos.isEmpty || filterIndex < 0) {
      return Container();
    } else {
      return Dismissible(
        key: ValueKey(selectTodo.id),
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
                  description: selectTodo.title);
              if (title == null) {
                return;
              }
              ref.read(todosProvider.notifier).edit(
                    filterdTodos[filterIndex].copyWith(title: title),
                    index,
                  );
            },
            child: Text(filterdTodos[filterIndex].title!),
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
                    filterdTodos[filterIndex]
                        .copyWith(isCompleted: dialogResult.value),
                    index,
                  );
            },
            child: Icon(
              filterdTodos[filterIndex].isCompleted
                  ? Icons.circle_outlined
                  : Icons.close,
              color: filterdTodos[filterIndex].isCompleted
                  ? Colors.green
                  : Colors.red,
            ),
          ),
        ),
      );
    }
  }
}
