import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/feature/ui/styles/colors.dart';
import 'package:todo_list/feature/ui/styles/sizes.dart';
import 'package:todo_list/feature/ui/styles/styles.dart';

class AppBarWidget extends HookWidget implements PreferredSizeWidget {
  const AppBarWidget({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: PlgSizes.m18),
        child: Text(title),
      ),
      titleTextStyle: PlgStyles.h6Black_ff282828_20,
      actions: [
        SizedBox(
          width: 48,
          height: 48,
          child: IconButton(
            icon: const Icon(Icons.close_outlined),
            // onPressed: () => Navigator.pop(context),
            onPressed: () {},
            color: PlgColor.grey_ff999999,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
