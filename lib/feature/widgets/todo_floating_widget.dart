import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/feature/models/todo_plan.dart';
import 'package:todo_list/feature/ui/styles/margins.dart';
import 'package:todo_list/feature/widgets/commons/bottom_modal_widget_2.dart';
import 'package:todo_list/feature/widgets/todo_floating_button_widget.dart';

class TodoFloatingButton extends HookWidget {
  final ToDoPlan toDoPlan;

  const TodoFloatingButton({required this.toDoPlan, super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ToDoFloatingButtonWidget(
          icon: Icons.edit_outlined,
          type: BottomType.add,
        ),
        PlgMargins.v16,
      ],
    );
  }
}
