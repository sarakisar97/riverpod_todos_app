import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todos_app/src/features/todos/presentation/todos_controller/todos_controller.dart';

class TodosList extends ConsumerWidget {
  const TodosList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosAsync = ref.watch(todosControllerProvider);
    return todosAsync.when(
        data: (todos) {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text(todos[index].id.toString()),
                title: Text(todos[index].title),
                subtitle: Text(todos[index].body),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    ref
                        .read(todosControllerProvider.notifier)
                        .delete(todos[index].id);
                  },
                ),
              );
            },
          );
        },
        error: (error, st) => Text(error.toString()),
        loading: () =>
            const Center(child: CircularProgressIndicator.adaptive()));
  }
}
