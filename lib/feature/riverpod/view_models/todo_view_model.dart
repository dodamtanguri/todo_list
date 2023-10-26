import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list/feature/extensions/list_extension.dart';
import 'package:todo_list/feature/models/todo.dart';
import 'package:uuid/uuid.dart';

class ToDoStateNotifier extends StateNotifier<List<Todo>> {
  ToDoStateNotifier() : super([]);

  List<Todo> filterByDate(DateTime selectedDate) {
    return state
        .where((todo) =>
            todo.actionDate?.day == selectedDate.day &&
            todo.actionDate?.month == selectedDate.month &&
            todo.actionDate?.year == selectedDate.year)
        .toList();
  }

  void add(String description, DateTime selectedDate) {
    state = [
      ...state,
      Todo(id: const Uuid().v1(), actionDate: selectedDate, title: description)
    ];
  }

  void edit(Todo todo, int index, DateTime selectedDate) {
    print('Updated todo: ${state[index]}');
    List<Todo> filteredState = filterByDate(selectedDate);
    filteredState = filteredState.copyReplaceAt(index, todo);
    state = state
        .where((todo) =>
            todo.actionDate?.day != selectedDate.day ||
            todo.actionDate?.month != selectedDate.month ||
            todo.actionDate?.year != selectedDate.year)
        .toList()
      ..addAll(filteredState);

    print('after update ${state[index]}');
  }

  void remove(DateTime selectedDate, int index) {
    

    List<Todo> filteredState = filterByDate(selectedDate);

    filteredState.removeAt(index);

    state = state
        .where((todo) =>
            todo.actionDate?.day != selectedDate.day ||
            todo.actionDate?.month != selectedDate.month ||
            todo.actionDate?.year != selectedDate.year)
        .toList()
      ..addAll(filteredState);

    
  }
}

final todosProvider =
    StateNotifierProvider<ToDoStateNotifier, List<Todo>>((ref) {
  return ToDoStateNotifier();
});
