import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/feature/models/todo.dart';
import 'package:todo_list/feature/models/todo_plan.dart';
import 'package:todo_list/feature/ui/styles/sizes.dart';
import 'package:todo_list/feature/widgets/commons/app_bar_widget.dart';
import 'package:todo_list/feature/widgets/calendar_widget.dart';
import 'package:todo_list/feature/widgets/commons/input_bottom_sheet_widget.dart';
import 'package:todo_list/feature/widgets/commons/message_box_widget.dart';
import 'package:todo_list/feature/widgets/todo_list_widget.dart';
import 'package:uuid/uuid.dart';

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

    void handleTodoUpdate(String description, String todoId) {
      final todoList = List<Todo>.from(
          todoPlan.value.list.where((element) => isSelectedTodoTest(element)));
      int index = todoList.indexWhere((targetTodo) => targetTodo.id == todoId);
      if (index != -1) {
        todoList[index] = todoList[index].copyWith(title: description);
      }
      todoPlan.value = todoPlan.value.copyWith(list: todoList);
    }

    void handleToDoDelete(String todoId) {
      final todoList = List<Todo>.from(
          todoPlan.value.list.where((element) => isSelectedTodoTest(element)));
      todoList.removeWhere((targetTodo) => targetTodo.id == todoId);
      todoPlan.value = todoPlan.value.copyWith(list: todoList);
    }

    void handleTodoStatus(bool result, String todoId) {
      final todoList = List<Todo>.from(
          todoPlan.value.list.where((element) => isSelectedTodoTest(element)));
      int index = todoList.indexWhere((targetTodo) => targetTodo.id == todoId);
      if (index != -1) {
        todoList[index] = todoList[index].copyWith(isCompleted: result);
      }
      todoPlan.value = todoPlan.value.copyWith(list: todoList);
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
                (selectedDate) => todoPlan.value =
                    todoPlan.value.copyWith(selectedDate: selectedDate),
                todoDate: todoPlan.value.selectedDate,
                isExistTodoDates:
                    todoPlan.value.list.map((todo) => todo.actionDate).toList(),
              ),
              //2. 이벤트 리스트 위젯
              Expanded(
                child: ToDoListWidget(
                  todos: todoPlan.value.list
                      .where((element) => isSelectedTodoTest(element))
                      .toList(),
                  onTodoUpdated: (description, id) async {
                    String? title = await InputBottomSheetWidget.show(context,
                        description: description);
                    handleTodoUpdate(title ?? description, id);
                  },
                  onTodoDeleted: (todoId) => handleToDoDelete(todoId),
                  onTodoStatusChanged: (result, id) async {
                    DialogResult? dialogResult = await MessageBoxWidget.show(
                        context,
                        message: '변경하시겠습니까?',
                        positiveLabel: '완료',
                        negativeLabel: '미완료');
                    handleTodoStatus(dialogResult?.value ?? result, id);
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (todoPlan.value.selectedDate == null) {
              //날짜가선택되지 않았습니다.
              return;
            }
            String? title = await InputBottomSheetWidget.show(
              context,
            );
            if (title == null || title.isEmpty) {
              //할일이 입력되지 않았습니다.  X
              return;
            }
            todoPlan.value = todoPlan.value.copyWith(list: [
              ...todoPlan.value.list,
              Todo(
                  id: const Uuid().v1(),
                  actionDate: todoPlan.value.selectedDate!,
                  title: title)
            ]);
          },
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.edit_outlined,
            color: Colors.black,
          ),
        ));
  }
}
