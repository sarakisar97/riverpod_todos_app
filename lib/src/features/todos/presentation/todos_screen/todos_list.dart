import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todos_app/src/features/todos/data/todos_repository.dart';

class TodosList extends ConsumerWidget {
  const TodosList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosAsync = ref.watch(todosProvider);
    return todosAsync.when(
        data: (todos) {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(todos[index].id.toString()),
                title: Text(todos[index].title),
                subtitle: Text(todos[index].body),
              );
            },
          );
        },
        error: (error, st) => Text(error.toString()),
        loading: () => const CircularProgressIndicator.adaptive());
  }
}
