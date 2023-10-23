import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/feature/models/todo.dart';

import 'package:uuid/uuid.dart';

enum BottomType {
  add,
  modifiy;
}

class BottomModalWidget2 extends HookWidget {
  final Todo? todo;
  final BottomType type;
  final DateTime? selectedDate;

  const BottomModalWidget2(
      {super.key, this.todo, this.selectedDate, required this.type});

  static Future<Todo?> show(
    BuildContext context, {
    Todo? todo,
    DateTime? selectedDate,
    required BottomType type,
  }) async {
    return showModalBottomSheet<Todo>(
      isScrollControlled: true,
      // backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => BottomModalWidget2(
          todo: todo, type: type, selectedDate: selectedDate),
    );
  }

  static void close(BuildContext context, Todo result) =>
      Navigator.of(context).pop<Todo>(result);

  static var uuid = const Uuid();

  String generateId() {
    return uuid.v1();
  }

  @override
  Widget build(BuildContext context) {
    final todoController = useTextEditingController(text: todo?.title ?? '');



    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextFormField(
            onEditingComplete: () => close(
                context,
                Todo(
                    id: generateId(),
                    actionDate: selectedDate ?? DateTime.now(),
                    title: todoController.text)),
            autofocus: true,
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
                onTap: () => close(
                    context,
                    Todo(
                        id: generateId(),
                        actionDate: selectedDate ?? DateTime.now(),
                        title: todoController.text)),
                child: const Icon(Icons.upload_rounded),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
