
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/feature/models/todo.dart';

part 'todo_plan.freezed.dart';

@freezed
class ToDoPlan with _$ToDoPlan {
  const factory ToDoPlan({
    required DateTime? selectedDate,
    //todos 로 이름 변경 
    @Default([]) List<Todo> list,
  }) = _ToDoPlan;
}
