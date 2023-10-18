import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list/feature/models/todo.dart';
import 'package:todo_list/feature/models/todo_plan.dart';
import 'package:todo_list/feature/utils/utils.dart';

class CalendarWidget extends HookWidget {
  ToDoPlan toDoPlan;
  CalendarWidget({required this.toDoPlan, super.key});

  @override
  Widget build(BuildContext context) {
    final calendarFormat = useState(CalendarFormat.month);
    final targetToDoPlan = useState(toDoPlan);

    final today = useState<DateTime>(DateTime.now());
    final selectedDate = useState<DateTime?>(today.value);
    
    return TableCalendar(
      locale: 'ko-KR',
      firstDay: kFirstDay,
      lastDay: kLastDay,
      focusedDay: toDoPlan.today,
      calendarFormat: calendarFormat.value,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: const CalendarStyle(
        outsideDaysVisible: false,
        markerSizeScale: 0.15,
        markersMaxCount: 1,
      ),
      selectedDayPredicate: (day) {
        return isSameDay(targetToDoPlan.value.selectedDate, day);
      },
      onDaySelected: (selectedDate, today) {
        print('selectedDate : $selectedDate');

        print('toDoPlan : $toDoPlan');
        print('useState targetToDoPlan : ${targetToDoPlan.value}');

        if (!isSameDay(targetToDoPlan.value.selectedDate, selectedDate)) {
          toDoPlan =
              toDoPlan.copyWith(selectedDate: selectedDate, today: today);
        }
      },
      onFormatChanged: (format) {
        if (calendarFormat.value != format) {
          calendarFormat.value = format;
        }
      },
      onPageChanged: (focus) {
        toDoPlan = toDoPlan.copyWith(today: focus);
      },
      headerStyle: const HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
      ),
    );
  }
}
