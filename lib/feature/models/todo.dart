import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
     String? id,
     DateTime? actionDate,
     String? title,
    @Default(false) bool isCompleted,
  }) = _Todo;
  
}












