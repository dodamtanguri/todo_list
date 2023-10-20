import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/feature/models/todo.dart';
import 'package:todo_list/feature/models/todo_plan.dart';
import 'package:todo_list/feature/ui/styles/sizes.dart';
import 'dart:math' as math;

typedef OnClickSubmit = Function(ToDoPlan);

class TodoBottomModalWidget extends HookWidget {
  const TodoBottomModalWidget(
      {
      //required this.onClickSubmit,
      required this.toDoPlan,
      required this.title,
      super.key});
  final ToDoPlan toDoPlan;
  final String title;
  //final OnClickSubmit onClickSubmit;

  int getMaxId(List<Todo> todos) {
    if (todos.isEmpty) return 0;
    return todos.map((todo) => todo.id).reduce(math.max);
  }
  //외부에서 부를 수 있도록 static으로 선언하고
  //받아야하는게 TodoPlan.list.todo를 가져와야하니까

  static PersistentBottomSheetController<Todo> show(
    BuildContext context, {
    required ToDoPlan todos,
    String? updatedTitle,
  }) =>
      showBottomSheet<Todo>(
          context: context,
          builder: (context) => TodoBottomModalWidget(
              toDoPlan: todos, title: updatedTitle ?? ''));
  static void close(BuildContext context, ToDoPlan toDoPlan) =>
      Navigator.of(context).pop(toDoPlan);

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
                  //추가일 경우
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
