import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_list/feature/riverpod/view_models/todo_view_model.dart';
import 'package:todo_list/feature/riverpod/widgets/todo_list_item_widget.dart';
import 'package:todo_list/feature/ui/styles/sizes.dart';
import 'package:todo_list/feature/widgets/commons/calendar_widget.dart';
import 'package:todo_list/feature/widgets/commons/app_bar_widget.dart';
import 'package:todo_list/feature/widgets/commons/input_bottom_sheet_widget.dart';

class RiverpodTodoMainView extends HookConsumerWidget {
  const RiverpodTodoMainView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = useState<DateTime>(DateTime.now());
    final todos = ref.watch(todosProvider);
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(title: 'TODOLISTAPP'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PlgSizes.m20),
        child: Column(
          children: [
            //1.캘린더 위젯
            CalendarWidget(
              (selectDate) => selectedDate.value = selectDate,
              todoDate: selectedDate.value,
              isExistTodoDates:
                  todos.map((todo) => todo.actionDate!).toList(),
            ),
            //2. 이벤트 리스트 위젯
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return ToDoListItemWidget(
                    selectDate: selectedDate.value,
                    index: index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? title = await InputBottomSheetWidget.show(
            context,
          );
          if (title != null) {
            ref.read(todosProvider.notifier).add(title, selectedDate.value);
          }
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.edit_outlined,
          color: Colors.black,
        ),
      ),
    );
  }
}
