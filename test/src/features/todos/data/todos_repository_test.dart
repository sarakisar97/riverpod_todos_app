import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_todos_app/src/features/todos/data/todos_repository.dart';
import 'package:riverpod_todos_app/src/features/todos/domain/todo/todo.dart';
import 'package:riverpod_todos_app/src/network/network_service.dart';

class MockNetworkService extends Mock implements NetworkService {
  @override
  Future<Response> get(String url,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken}) async {
    return Response(data: [
      {
        "userId": 1,
        "id": 1,
        "title": "delectus aut autem",
        "body": "lorem ipsum",
      },
      {
        "userId": 1,
        "id": 2,
        "title": "quis ut nam facilis et officia qui",
        "body": "lorem ipsum",
      }
    ], statusCode: 200, requestOptions: RequestOptions());
  }
}

void main() {
  late ProviderContainer providerContainer;
  late TodosRepository repository;

  setUp(() {
    final mockNetworkService = MockNetworkService();
    providerContainer = ProviderContainer(
      overrides: [
        todosRepositoryProvider.overrideWithValue(
          TodosRepository(mockNetworkService),
        ),
      ],
    );
    repository = providerContainer.read(todosRepositoryProvider);
  });

  test('Should return list of todos', () async {
    // Act
    final result = await repository.getTodos();

    // Assert
    expect(result, isA<List<Todo>>());
  });
}
