import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/feature/models/todo_plan.dart';
import 'package:todo_list/feature/ui/styles/sizes.dart';
import 'package:todo_list/feature/widgets/app_bar_widget.dart';
import 'package:todo_list/feature/widgets/calendar_widget.dart';
import 'package:todo_list/feature/widgets/event_floating_widget.dart';
import 'package:todo_list/feature/widgets/event_list_item_widget.dart';
import 'package:todo_list/feature/widgets/event_list_widget.dart';

class ToDoMainView extends HookWidget {
  const ToDoMainView({super.key});

  @override
  Widget build(BuildContext context) {
    final todoPlan =
        useState<ToDoPlan>(ToDoPlan(selectedDate: null, today: DateTime.now()));

    return Scaffold(
      appBar: const AppBarWidget(title: 'TODOLISTAPP'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PlgSizes.m20),
        child: Column(
          children: [
            //1.캘린더 위젯
            CalendarWidget(
              toDoPlan: todoPlan,
            ),
            //2. 이벤트 리스트 위젯
            const Expanded(child: EventListWidget()),
            const EventListItemWidget(),
          ],
        ),
      ),
      floatingActionButton: EventFloatingWidget(
        toDoPlan: todoPlan.value,
      ),
    );
  }
}
