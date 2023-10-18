import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list/feature/models/todo.dart';
import 'package:todo_list/feature/models/todo_plan.dart';
import 'package:todo_list/feature/utils/utils.dart';

class CalendarWidget extends HookWidget {
  ValueNotifier<ToDoPlan> toDoPlan;
  CalendarWidget({required this.toDoPlan, super.key});

  @override
  Widget build(BuildContext context) {
    final calendarFormat = useState(CalendarFormat.month);
    return TableCalendar(
      locale: 'ko-KR',
      firstDay: kFirstDay,
      lastDay: kLastDay,
      focusedDay: toDoPlan.value.today,
      calendarFormat: calendarFormat.value,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: const CalendarStyle(
        outsideDaysVisible: false,
        markerSizeScale: 0.15,
        markersMaxCount: 1,
      ),
      selectedDayPredicate: (day) {
        return isSameDay(toDoPlan.value.selectedDate, day);
      },
      onDaySelected: (selectedDate, today) {
        if (!isSameDay(toDoPlan.value.selectedDate, selectedDate)) {
          toDoPlan.value = toDoPlan.value.copyWith(selectedDate: selectedDate);
        }
      },
      onFormatChanged: (format) {
        if (calendarFormat.value != format) {
          calendarFormat.value = format;
        }
      },
      onPageChanged: (focus) {
        toDoPlan.value = toDoPlan.value.copyWith(today: focus);
      },
      headerStyle: const HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
      ),
    );
  }
}
