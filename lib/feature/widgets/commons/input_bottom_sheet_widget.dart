import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'input_bottom_sheet_widget.freezed.dart';

@freezed
class TodoInputResult with _$TodoInputResult {
  const factory TodoInputResult({
    required String description,
    required bool isCreate,
  }) = _TodoInputResult;
}

class InputBottomSheetWidget extends HookWidget {
  final String? description;

  const InputBottomSheetWidget({super.key, this.description});

  static Future<String?> show(
    BuildContext context, {
    String? description,
  }) async =>
      showModalBottomSheet<String>(
        isScrollControlled: true,
        context: context,
        builder: (context) => InputBottomSheetWidget(description: description),
      );

  static void close(BuildContext context, String result, bool isCreate) =>
      Navigator.of(context).pop<String>(
        result,
      );

  @override
  Widget build(BuildContext context) {
    print('BottomModalWidget2');
    final todoController = useTextEditingController(text: description);

    final bool isCreate = description != null;

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextFormField(
            onEditingComplete: () =>
                close(context, todoController.text, isCreate),
            // autofocus: true,
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
                onTap: () => close(context, todoController.text, isCreate),
                child: const Icon(Icons.upload_rounded),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
