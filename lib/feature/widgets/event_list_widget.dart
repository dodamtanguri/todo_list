import 'package:flutter/material.dart';
import 'package:todo_list/feature/models/todo_plan.dart';
import 'package:todo_list/feature/widgets/event_list_item_widget.dart';

class EventListWidget extends StatelessWidget {
  final ToDoPlan todoPlan;

  const EventListWidget({super.key, required this.todoPlan});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todoPlan.list.length,
      itemBuilder: (context, index) {
        return EventListItemWidget(todo: todoPlan.list[index]);
      },
    );
  }
}
