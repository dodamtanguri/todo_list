import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/feature/models/todo.dart';
import 'package:todo_list/feature/models/todo_plan.dart';
import 'package:todo_list/feature/ui/styles/sizes.dart';
import 'dart:math' as math;

typedef OnClickSubmit = Function(ToDoPlan);

class BottomModalWidget extends HookWidget {
  final ToDoPlan toDoPlan;
  const BottomModalWidget(
      {required this.onClickSubmit,
      required this.toDoPlan,
      required this.title,
      super.key});
  final String title;
  final OnClickSubmit onClickSubmit;

  int getMaxId(List<Todo> todos) {
    if (todos.isEmpty) return 0;
    return todos.map((todo) => todo.id).reduce(math.max);
  }

  @override
  Widget build(BuildContext context) {
    final todoController = useTextEditingController(text: '');

    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.70,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(PlgSizes.wh14),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: PlgSizes.m20),
          child: TextField(
            controller: todoController,
            keyboardType: TextInputType.text,
            autocorrect: false,
            decoration: InputDecoration(
              hintText: title,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade400,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade400,
                ),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  final newId = getMaxId(toDoPlan.list) + 1;
                  final updateToDoPlan = toDoPlan.copyWith(list: [
                    ...toDoPlan.list,
                    Todo(
                        id: newId,
                        title: todoController.text,
                        actionDate: toDoPlan.selectedDate ?? DateTime.now())
                  ]);

                  Navigator.of(context).pop(updateToDoPlan);
                },
                child: const Icon(Icons.upload_rounded),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
