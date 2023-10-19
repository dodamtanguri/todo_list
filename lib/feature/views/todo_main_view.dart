import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
    return Scaffold(
      appBar: const AppBarWidget(title: 'TODOLISTAPP'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PlgSizes.m20),
        child: Column(
          children: [
            //1.캘린더 위젯
            CalendarWidget(
                onSelectDate: (selectDate) => todoPlan.value = selectDate),
            //2. 이벤트 리스트 위젯
            Expanded(child: EventListWidget(todoPlan: todoPlan.value)),
          ],
        ),
      ),
      floatingActionButton: EventFloatingWidget(
        toDoPlan: todoPlan.value,
        onPassToDoPlanList: (value) => {todoPlan.value = value},
      ),
    );
  }
}
