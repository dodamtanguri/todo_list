import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/feature/widgets/app_bar_widget.dart';
import 'package:todo_list/feature/widgets/calendar_widget.dart';

class MainView extends HookWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'TODOLISTAPP'),
      body: CalendarWidget(),
    );
  }
}
