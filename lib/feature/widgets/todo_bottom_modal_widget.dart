import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/feature/models/todo.dart';
import 'package:todo_list/feature/models/todo_plan.dart';
import 'package:todo_list/feature/ui/styles/sizes.dart';

//여기서 todoPlan을 다시 위로 넘겨줘야함.
class TodoBottomModalWidget extends HookWidget {
  TodoBottomModalWidget(
      {required this.todoPlan, required this.title, super.key});
  final String title;
  ToDoPlan todoPlan;

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
                  print('copy 전 todo planv : $todoPlan');
                  todoPlan = todoPlan.copyWith(list: [
                    ...todoPlan.list ?? [],
                    Todo(title: todoController.text)
                  ]);
                  print('copy 된 todo planv : $todoPlan');
                  print(todoPlan.list?.first.title);
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
