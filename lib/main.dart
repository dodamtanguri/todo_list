import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:todo_list/feature/riverpod/views/riverpod_todo_main_view.dart';
import 'package:todo_list/feature/views/todo_main_view.dart';

void main() async {
  await initializeDateFormatting();
  // ProviderScope 등록
  runApp(const ProviderScope(
    child: TodoListApp(),
  ));
}

class TodoListApp extends StatelessWidget {
  const TodoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: RiverpodTodoMainView(),
    );
  }
}
