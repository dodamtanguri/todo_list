import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list/feature/models/todo_plan.dart';
import 'package:todo_list/feature/utils/utils.dart';

typedef OnSelectDate = Function(ToDoPlan);

class CalendarWidget extends HookWidget {
  // ToDoPlan toDoPlan;
  const CalendarWidget({required this.onSelectDate, super.key});

  final OnSelectDate onSelectDate;

  DateTime setToMidnight(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day, 0, 0, 0);
  }

  @override
  Widget build(BuildContext context) {
    final calendarFormat = useState(CalendarFormat.month);

    final selectToDoDate =
        useState<ToDoPlan>(const ToDoPlan(selectedDate: null));

    var today = setToMidnight(DateTime.now());

    return TableCalendar(
      locale: 'ko-KR',
      firstDay: kFirstDay,
      lastDay: kLastDay,
      focusedDay: today,
      calendarFormat: calendarFormat.value,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: const CalendarStyle(
        outsideDaysVisible: false,
        markerSizeScale: 0.15,
        markersMaxCount: 1,
      ),
      selectedDayPredicate: (day) {
        return isSameDay(selectToDoDate.value.selectedDate, day);
      },
      //1.여기서 부모 위젯으로 넘겨주는 eventhandler가 필요함.
      onDaySelected: (selectedDate, today) {
        if (!isSameDay(selectToDoDate.value.selectedDate, selectedDate)) {
          selectToDoDate.value =
              selectToDoDate.value.copyWith(selectedDate: selectedDate);
          onSelectDate(selectToDoDate.value);
        }
      },
      onFormatChanged: (format) {
        if (calendarFormat.value != format) {
          calendarFormat.value = format;
        }
      },
      // onPageChanged: (focus) {
      //   today = focus;
      // },
      headerStyle: const HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
      ),
    );
  }
}
