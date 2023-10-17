import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list/feature/utils/utils.dart';

typedef OnDaySelected = VoidCallback;

class CalendarWidget extends HookWidget {
  const CalendarWidget({super.key});


  @override
  Widget build(BuildContext context) {

    final calendarFormat = useState(CalendarFormat.month);
    final today = useState(DateTime.now());
    final selectdDay = useState<DateTime?>(null);



    return TableCalendar(
      locale: 'ko-KR',
      firstDay: kFirstDay,
      lastDay: kLastDay,
      focusedDay: today.value,
      calendarFormat: calendarFormat.value,
      startingDayOfWeek: StartingDayOfWeek.monday,

       calendarStyle: const CalendarStyle(
              outsideDaysVisible: false,
              markerSizeScale: 0.15,
              markersMaxCount: 1,
            ),
      selectedDayPredicate: (day) {
        return isSameDay(selectdDay.value, day);
      },
      onDaySelected: (selectedDay, today) {
        if (!isSameDay(selectdDay.value, selectedDay)) {
          selectdDay.value = selectedDay;
          today = today;
        }
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
