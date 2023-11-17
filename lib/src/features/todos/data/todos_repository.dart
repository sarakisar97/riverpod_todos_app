import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todos_app/src/constants/endpoints.dart';
import 'package:riverpod_todos_app/src/features/todos/domain/todo/todo.dart';
import 'package:riverpod_todos_app/src/network/network_service.dart';

part 'todos_repository.g.dart';

@riverpod
TodosRepository todosRepository(TodosRepositoryRef ref) {
  return TodosRepository(ref.watch(networkServiceProvider()));
}

class TodosRepository {
  final NetworkService _networkService;

  TodosRepository(this._networkService);

  Future<List<Todo>> getTodos() async {
    final response = await _networkService.get(Endpoints.todos);
    return (response.data as List)
        .map((e) => Todo.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
