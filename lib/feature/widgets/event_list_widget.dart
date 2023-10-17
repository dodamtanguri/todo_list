import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo_list/feature/ui/styles/colors.dart';

class EventListWidget extends HookWidget {
  const EventListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      color: PlgColor.primary_light_ff69cdff,
       child: Text('EventListWidget'),
    );
  }
}
