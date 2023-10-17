import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/feature/ui/styles/sizes.dart';
import 'package:todo_list/feature/widgets/app_bar_widget.dart';
import 'package:todo_list/feature/widgets/calendar_widget.dart';
import 'package:todo_list/feature/widgets/event_floating_widget.dart';
import 'package:todo_list/feature/widgets/event_list_widget.dart';

class MainView extends HookWidget {
  const MainView({super.key});

  

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(title: 'TODOLISTAPP'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: PlgSizes.m20),
        child: Column(
          children: [
            //1.캘린더 위젯
            CalendarWidget(),
            //2. 이벤트 리스트 위젯
            Expanded(child: EventListWidget()),
          ],
        ),
      ),
      floatingActionButton: EventFloatingWidget(),
    );
  }
}
