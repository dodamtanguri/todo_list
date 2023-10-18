import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/feature/models/todo_plan.dart';
import 'package:todo_list/feature/ui/styles/margins.dart';
import 'package:todo_list/feature/widgets/todo_bottom_modal_widget.dart';
import 'package:todo_list/feature/widgets/todo_floating_button_widget.dart';

class EventFloatingWidget extends HookWidget {
  const EventFloatingWidget({required this.toDoPlan, super.key});

  final ToDoPlan toDoPlan;

  void onClickEventEdit() {}

  @override
  Widget build(BuildContext context) {
    void onClickShowTextModal() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => TodoBottomModalWidget(
          title: 'Todo추가하기',
          todoPlan: toDoPlan,
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ToDoFloatingButtonWidget(
            icon: Icons.edit_outlined,
            onClickEventButton: onClickShowTextModal),
        PlgMargins.v16,
      ],
    );
  }
}
