import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/feature/models/todo.dart';
import 'package:todo_list/feature/ui/styles/margins.dart';
import 'package:todo_list/feature/widgets/commons/bottom_modal_widget_2.dart';
import 'package:todo_list/feature/widgets/todo_floating_button_widget.dart';

typedef OnclickSubmit = Function(Todo);

class TodoFloatingButton extends HookWidget {
  const TodoFloatingButton(
      {this.selectedDate,  this.onClickSubmit, super.key});

  final DateTime? selectedDate;
  final OnclickSubmit? onClickSubmit;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ToDoFloatingButtonWidget(
          icon: Icons.edit_outlined,
          type: BottomType.add,
          selectDate: selectedDate,
          onClickSubmit: (todo) => onClickSubmit!(todo),
        ),
        PlgMargins.v16,
      ],
    );
  }
}
