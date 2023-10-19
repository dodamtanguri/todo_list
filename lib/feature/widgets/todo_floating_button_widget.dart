import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef OnClickEventButton = VoidCallback;

class ToDoFloatingButtonWidget extends HookWidget {
  const ToDoFloatingButtonWidget(
      {required this.icon, required this.onClickEventButton, super.key});

  final OnClickEventButton onClickEventButton;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onClickEventButton,
      backgroundColor: Colors.white,
      child: Icon(icon, color: Colors.black,),
    );
  }
}
