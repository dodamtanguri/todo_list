import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/feature/models/todo.dart';
import 'package:todo_list/feature/widgets/commons/bottom_modal_widget_2.dart';

typedef OnClickSubmit = Function(Todo);

class ToDoFloatingButtonWidget extends HookWidget {
  const ToDoFloatingButtonWidget(
      {required this.icon, required this.type,
         this.onClickSubmit, 
        this.selectDate,
       super.key});

  final BottomType type;
  final IconData icon;
  final OnClickSubmit? onClickSubmit;
  final DateTime? selectDate;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        Todo? result = await BottomModalWidget2.show(context, type: type, selectedDate: selectDate);
        if(result != null) {
          print('추가 : $result');
          onClickSubmit!(result);
        }
      },
      backgroundColor: Colors.white,
      child: Icon(
        icon,
        color: Colors.black,
      ),
    );
  }
}
