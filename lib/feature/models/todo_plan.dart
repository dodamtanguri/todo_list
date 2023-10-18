
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/feature/models/todo.dart';


part 'todo_plan.g.dart';

part 'todo_plan.freezed.dart';

@freezed
class ToDoPlan with _$ToDoPlan {
  const factory ToDoPlan({
    required DateTime? selectedDate,
    @Default([]) List<Todo> list,
  }) = _ToDoPlan;

  factory ToDoPlan.fromJson(Map<String, dynamic> json) =>
      _$ToDoPlanFromJson(json);
}
