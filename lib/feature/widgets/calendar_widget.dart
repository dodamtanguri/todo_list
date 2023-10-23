import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list/feature/utils/utils.dart';

typedef OnClickDate = Function(DateTime selectedDate);

class CalendarWidget extends HookWidget {
  const CalendarWidget(this.onClickDate,
      {required this.todoDate, required this.isExistTodoDates, super.key});

  final OnClickDate onClickDate;
  final DateTime? todoDate;
  final List<DateTime> isExistTodoDates;

  DateTime setToMidnight(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day, 0, 0, 0);
  }

  @override
  Widget build(BuildContext context) {
    print('calendarWidget');

    final selectedDate = useState(todoDate);

    final calendarFormat = useState(CalendarFormat.month);

    var today = useState(setToMidnight(DateTime.now()));

    return TableCalendar(
      locale: 'ko-KR',
      firstDay: kFirstDay,
      lastDay: kLastDay,
      focusedDay: today.value,
      calendarFormat: calendarFormat.value,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      daysOfWeekStyle:
          const DaysOfWeekStyle(weekendStyle: TextStyle(color: Colors.red)),
      calendarStyle: const CalendarStyle(
        weekendTextStyle: TextStyle(color: Colors.red),
        outsideDaysVisible: true,
        markerSizeScale: 0.15,
        markersMaxCount: 1,
      ),
      eventLoader: (day) {
        if (isExistTodoDates.contains(day)) {
          return ['hi'];
        }
        return [];
      },
      selectedDayPredicate: (day) {
        return isSameDay(selectedDate.value, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        selectedDate.value = selectedDay;
        onClickDate(selectedDay);
      },
      onFormatChanged: (format) {
        if (calendarFormat.value != format) {
          calendarFormat.value = format;
        }
      },
      onPageChanged: (focus) {
        today.value = focus;
      },
      headerStyle: const HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
      ),
    );
  }
}
