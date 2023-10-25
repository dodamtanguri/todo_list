import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/feature/extensions/list_extension.dart';
import 'package:todo_list/feature/models/todo.dart';
import 'package:uuid/uuid.dart';

class ToDoStateNotifier extends StateNotifier<List<Todo>> {
  ToDoStateNotifier() : super([]);

  void add(String description, DateTime selectedDate) {
    state = [
      ...state,
      Todo(id: const Uuid().v1(), actionDate: selectedDate, title: description)
    ];
  }

  void edit(Todo todo, int index) {
    state = state.copyReplaceAt(index, todo);
  }

  void remove(int index) {
    state = state.copyRemoveAt(index);
  }
}

final todosProvider =
    StateNotifierProvider<ToDoStateNotifier, List<Todo>>((ref) {
  return ToDoStateNotifier();
});
