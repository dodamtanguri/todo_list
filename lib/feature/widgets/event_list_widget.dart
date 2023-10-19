import 'package:flutter/material.dart';
import 'package:todo_list/feature/models/todo.dart';

import 'package:todo_list/feature/widgets/event_list_item_widget.dart';

class EventListWidget extends StatelessWidget {
  final List<Todo> todos;

  const EventListWidget({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return EventListItemWidget(todo: todos[index]);
      },
    );
  }
}
