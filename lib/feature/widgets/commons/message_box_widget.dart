import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/feature/ui/styles/margins.dart';
import 'package:todo_list/feature/ui/styles/styles.dart';

enum DialogResult {
  ok(value: true),
  cancle(value: false);

  const DialogResult({
    required this.value,
  });
  final bool value;
}

class MessageBoxWidget extends HookWidget {
  const MessageBoxWidget({
    super.key,
    required this.title,
    required this.message,
    required this.positiveLabel,
    required this.negativeLabel,
  });

  final String title;
  final String message;
  final String positiveLabel;
  final String negativeLabel;

  static Future<DialogResult?> show(BuildContext context,
          {required String message,
          String? title,
          String? positiveLabel,
          String? negativeLabel}) async =>
      showDialog<DialogResult>(
          context: context,
          builder: (context) => MessageBoxWidget(
                title: title ?? "알림",
                message: message,
                positiveLabel: positiveLabel ?? "확인",
                negativeLabel: negativeLabel ?? "취소",
              ));

  static void close(BuildContext context, DialogResult result) =>
      Navigator.of(context).pop<DialogResult>(result);

  @override
  Widget build(BuildContext context) {
    print('dialogwidget');
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () => close(context, DialogResult.ok),
              style: FilledButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(14.0),
                ),
              ),
              child: Text(
                positiveLabel,
                style: PlgStyles.subtitle2B85_d9282828_14,
              ),
            ),
            PlgMargins.h10,
            FilledButton(
              onPressed: () => close(context, DialogResult.cancle),
              style: FilledButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(14.0),
                ),
              ),
              child: Text(
                negativeLabel,
                style: PlgStyles.subtitle2B85_d9282828_14,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
