import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/feature/models/todo.dart';
import 'package:todo_list/feature/models/todo_plan.dart';
import 'package:todo_list/feature/ui/styles/sizes.dart';

typedef OnClickSubmit = Function(ToDoPlan);

//여기서 todoPlan을 다시 위로 넘겨줘야함.
class TodoBottomModalWidget extends HookWidget {
  ToDoPlan toDoPlan;
  TodoBottomModalWidget(
      {required this.onClickSubmit,
      required this.toDoPlan,
      required this.title,
      super.key});
  final String title;
  final OnClickSubmit onClickSubmit;

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
            onEditingComplete: () {},
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
                  print('copy 전 todo planv : $toDoPlan.value');
                  toDoPlan = toDoPlan.copyWith(list: [
                    ...toDoPlan.list ?? [],
                    Todo(
                        title: todoController.text,
                        actionDate: toDoPlan.selectedDate!)
                  ]);

                  print('copy 된 todo plan : $toDoPlan.value');
                  print(toDoPlan.list.first.title);
                  onClickSubmit(toDoPlan);
                  Navigator.of(context).pop();
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
