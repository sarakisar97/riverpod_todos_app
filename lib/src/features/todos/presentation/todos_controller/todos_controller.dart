import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todos_app/src/features/todos/data/todos_repository.dart';
import 'package:riverpod_todos_app/src/features/todos/domain/todo/todo.dart';

part 'todos_controller.g.dart';

@riverpod
class TodosController extends _$TodosController {
  @override
  FutureOr<List<Todo>> build() {
    return ref.watch(todosRepositoryProvider).getTodos();
  }

  void delete(int todoId) {
    state = AsyncData((state as AsyncData<List<Todo>>).asData!.value.where((element) => element.id != todoId).toList());
  }

  void add(Todo todo) {
    state = AsyncData((state as AsyncData<List<Todo>>).asData!.value..add(todo));
  }

  void updateTodo(Todo todo) {
    state = AsyncData((state as AsyncData<List<Todo>>).asData!.value.map((e) => e.id == todo.id ? todo : e).toList());
  }

}