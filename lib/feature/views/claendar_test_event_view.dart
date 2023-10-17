// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:todo_list/feature/utils/utils.dart';

class TableEventsExample extends HookWidget {
  const TableEventsExample({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedEvents = useState<List<Event>>([]);
    final calendarFormat = useState<CalendarFormat>(CalendarFormat.month);

    final focusedDay = useState<DateTime>(DateTime.now());
    final selectedDay = useState<DateTime?>(focusedDay.value);

    useEffect(() {
      selectedDay.value = focusedDay.value;
      selectedEvents.value = _getEventsForDay(selectedDay.value!);
      return () {};
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('TableCalendar - Events'),
      ),
      body: Column(
        children: [
          TableCalendar<Event>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: focusedDay.value,
            selectedDayPredicate: (day) => isSameDay(selectedDay.value, day),
            calendarFormat: calendarFormat.value,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: const CalendarStyle(
              outsideDaysVisible: false,
              markerSizeScale: 0.15,
              markersMaxCount: 1,
            ),
            onDaySelected: (select, focus) {
              if (!isSameDay(selectedDay.value, select)) {
                selectedDay.value = select;
                focusedDay.value = focus;

                selectedEvents.value = _getEventsForDay(selectedDay.value!);
              }
            },
            onFormatChanged: (format) {
              if (calendarFormat.value != format) {
                calendarFormat.value = format;
              }
            },
            onPageChanged: (focus) {
              focusedDay.value = focus;
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        onTap: () => print('${value[index]}'),
                        title: Text('${value[index]}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }
}
