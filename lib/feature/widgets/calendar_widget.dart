import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list/feature/utils/utils.dart';

class CalendarWidget extends HookWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final calendarFormat = useState(CalendarFormat.month);
    final focusedDay = useState(DateTime.now());
    final selectdDay = useState<DateTime?>(null);

    return TableCalendar(
      locale: 'ko-KR',
      firstDay: kFirstDay,
      lastDay: kLastDay,
      focusedDay: focusedDay.value,
      calendarFormat: calendarFormat.value,
      selectedDayPredicate: (day) {
        return isSameDay(selectdDay.value, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(selectdDay.value, selectedDay)) {
          selectdDay.value = selectedDay;
          focusedDay = focusedDay;
        }
      },
      onFormatChanged: (format) {
        if (calendarFormat.value != format) {
          calendarFormat.value = format;
        }
      },
      onPageChanged: (focusedDay) {
        focusedDay = focusedDay;
      },
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
      ),
    );
  }
}
