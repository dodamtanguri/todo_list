import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/feature/models/todo.dart';
import 'package:todo_list/feature/models/todo_plan.dart';
import 'package:todo_list/feature/ui/styles/sizes.dart';
import 'package:todo_list/feature/widgets/app_bar_widget.dart';
import 'package:todo_list/feature/widgets/calendar_widget.dart';
import 'package:todo_list/feature/widgets/event_floating_widget.dart';
import 'package:todo_list/feature/widgets/event_list_widget.dart';

class ToDoMainView extends HookWidget {
  const ToDoMainView({super.key});

  DateTime setToMidnight(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day, 0, 0, 0);
  }

  @override
  Widget build(BuildContext context) {
    final todoPlan = useState<ToDoPlan>(const ToDoPlan(selectedDate: null));

    bool isSelectedTodoTest(Todo todo) {
      if (todoPlan.value.selectedDate == null) return false;
      return todo.actionDate.year == todoPlan.value.selectedDate?.year &&
          todo.actionDate.month == todoPlan.value.selectedDate?.month &&
          todo.actionDate.day == todoPlan.value.selectedDate?.day;
    }

    bool isRemovedTodoTest(Todo todo) => true;

    final todos = todoPlan.value.list
        .where((element) => isRemovedTodoTest(element))
        .toList();

    final filteredTodos = todoPlan.value.list
        .where((element) => isSelectedTodoTest(element))
        .toList();

    return Scaffold(
      appBar: const AppBarWidget(title: 'TODOLISTAPP'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PlgSizes.m20),
        child: Column(
          children: [
            //1.캘린더 위젯
            CalendarWidget(onSelectDate: (selectDate) {
              todoPlan.value = todoPlan.value
                  .copyWith(selectedDate: selectDate.selectedDate);
            }),

            //2. 이벤트 리스트 위젯
            Expanded(
              child: EventListWidget(
                todos: todoPlan.value.list
                    .where((element) => isSelectedTodoTest(element))
                    .toList(),
                onTodoUpdated: (updatedTodo) {
                  final updatedList = List<Todo>.from(todoPlan.value.list);
                  int index = updatedList
                      .indexWhere((todo) => todo.id == updatedTodo.id);
                  if (index != -1) {
                    updatedList[index] = updatedTodo;
                  }
                  todoPlan.value = todoPlan.value.copyWith(list: updatedList);
                },
                onDelete: (todoId) {
                  final updatedList = List<Todo>.from(todoPlan.value.list);
                  // 삭제 전 리스트 출력
                  print('Before deletion: $updatedList');

                  updatedList.removeWhere((todo) => todo.id == todoId);

                  // 삭제 후 리스트 출력
                  print('After deletion: $updatedList');
                  todoPlan.value = todoPlan.value.copyWith(list: updatedList);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: EventFloatingWidget(
        toDoPlan: todoPlan.value,
        onPassToDoPlanList: (value) {
          todoPlan.value = value;
        },
      ),
    );
  }
}
