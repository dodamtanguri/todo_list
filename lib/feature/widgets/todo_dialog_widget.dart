import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum DialogResult {
  ok(value: true),
  cancle(value: false);

  const DialogResult({
    required this.value,
  });
  final bool value;
}

class ToDoDialogWidget extends HookWidget {
  const ToDoDialogWidget(
      {super.key,
      required this.title,
      required this.message,
      required this.positiveLabel});

  final String title;
  final String message;
  final String positiveLabel;

  static Future<DialogResult?> show(BuildContext context,
          {required String message,
          String? title,
          String? positiveLabel}) async =>
      showDialog<DialogResult>(
          context: context,
          builder: (context) => ToDoDialogWidget(
              title: title ?? "알림",
              message: message,
              positiveLabel: positiveLabel ?? "확인"));

  static void close(BuildContext context, DialogResult result) =>
      Navigator.of(context).pop<DialogResult>(result);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => close(context, DialogResult.ok),
          child: Text(positiveLabel),
        ),
        TextButton(
          onPressed: () => close(context, DialogResult.cancle),
          child: const Text('취소'),
        ),
      ],
    );
  }
}
