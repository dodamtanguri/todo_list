import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/feature/models/todo.dart';
import 'package:todo_list/feature/models/todo_plan.dart';
import 'package:todo_list/feature/ui/styles/sizes.dart';
import 'package:todo_list/feature/widgets/commons/app_bar_widget.dart';
import 'package:todo_list/feature/widgets/calendar_widget.dart';
import 'package:todo_list/feature/widgets/todo_floating_widget.dart';
import 'package:todo_list/feature/widgets/todo_list_widget.dart';

class ToDoMainView extends HookWidget {
  const ToDoMainView({super.key});

  DateTime setToMidnight(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day, 0, 0, 0);
  }

  @override
  Widget build(BuildContext context) {
    final todoPlan = useState<ToDoPlan>(ToDoPlan(selectedDate: DateTime.now()));

    bool isSelectedTodoTest(Todo todo) {
      if (todoPlan.value.selectedDate == null) return false;
      return todo.actionDate.year == todoPlan.value.selectedDate?.year &&
          todo.actionDate.month == todoPlan.value.selectedDate?.month &&
          todo.actionDate.day == todoPlan.value.selectedDate?.day;
    }

    //todo 상태 변경
    void handleTodoUpdate(Todo updatedTodo) {
      final updatedList = List<Todo>.from(todoPlan.value.list);
      int todoId = updatedList.indexWhere((todo) => todo.id == updatedTodo.id);
      if (todoId != -1) {
        updatedList[todoId] = updatedTodo;
      }
      todoPlan.value = todoPlan.value.copyWith(list: updatedList);
    }

    void handleToDoDelete(String todoId) {
      final updatedList = List<Todo>.from(todoPlan.value.list);
      updatedList.removeWhere((todo) => todo.id == todoId);
      todoPlan.value = todoPlan.value.copyWith(list: updatedList);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(title: 'TODOLISTAPP'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PlgSizes.m20),
        child: Column(
          children: [
            //1.캘린더 위젯
            CalendarWidget(
              (todoDate) => todoPlan.value =
                  todoPlan.value.copyWith(selectedDate: todoDate),
              todoDate: todoPlan.value.selectedDate,
              isTodoExist:
                  todoPlan.value.list.map((todo) => todo.actionDate).toList(),
            ),
            //2. 이벤트 리스트 위젯
            Expanded(
              child: ToDoListWidget(
                todos: todoPlan.value.list
                    .where((element) => isSelectedTodoTest(element))
                    .toList(),
                onTodoUpdated: (updatedTodo) => handleTodoUpdate(updatedTodo),
                onDelete: (todoId) => handleToDoDelete(todoId),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: TodoFloatingButton(
          selectedDate: todoPlan.value.selectedDate,
          onClickSubmit: (todo) {
            todoPlan.value =
                todoPlan.value.copyWith(list: [...todoPlan.value.list, todo]);
          }),
    );
  }
}
