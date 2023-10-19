import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/feature/models/todo_plan.dart';
import 'package:todo_list/feature/ui/styles/margins.dart';
import 'package:todo_list/feature/widgets/todo_bottom_modal_widget.dart';
import 'package:todo_list/feature/widgets/todo_floating_button_widget.dart';

typedef OnPassToDoPlanList = Function(ToDoPlan);

class EventFloatingWidget extends HookWidget {
  final ToDoPlan toDoPlan;
  final OnPassToDoPlanList onPassToDoPlanList;

  const EventFloatingWidget(
      {required this.onPassToDoPlanList, required this.toDoPlan, super.key});

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
          toDoPlan: toDoPlan,
          onClickSubmit: (p0) => {onPassToDoPlanList(p0)},
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
