import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/feature/models/todo.dart';
import 'dart:math' as math;

enum BottomType {
  add,
  modifiy;
}

class BottomModalWidget2 extends HookWidget {
  final Todo? todo;
  final BottomType type;

  const BottomModalWidget2({super.key, this.todo, required this.type});

  static Future<Todo?> show(
    BuildContext context, {
    Todo? todo,
    required BottomType type,
  }) async {
    return showModalBottomSheet<Todo>(
      isScrollControlled: true,
      // backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => BottomModalWidget2(
        todo: todo,
        type: type,
      ),
    );
  }

  //TODO 를 반환해야하니까
  static void close(BuildContext context, Todo result) =>
      Navigator.of(context).pop<Todo>(result);

  @override
  Widget build(BuildContext context) {
    final todoController = useTextEditingController(text: todo?.title ?? '');

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: 400,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            controller: todoController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
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
                //여기서는 그냥 todo 위로 넘기기만 하자 
                onTap: () {},
                child: const Icon(Icons.upload_rounded),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
