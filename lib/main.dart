import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:todo_list/feature/views/calendar_test_view.dart';
import 'package:todo_list/feature/views/claendar_test_event_view.dart';
import 'package:todo_list/feature/views/main_view.dart';

void main() async {
  await initializeDateFormatting();
  runApp(const TodoListApp());
}

class TodoListApp extends StatelessWidget {
  const TodoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      home: const TableEventsExample(),
    );
  }
}
