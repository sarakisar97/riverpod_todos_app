import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todos_app/src/features/auth/application/auth_token_controller.dart';
import 'package:riverpod_todos_app/src/features/todos/presentation/todos_screen/todos_list.dart';
import 'package:riverpod_todos_app/src/routing/app_router.dart';

@RoutePage()
class TodosScreen extends ConsumerWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todos'),
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () => ref.read(authTokenControllerProvider.notifier).deleteToken(),
            )
          ],
        ),
        body: const TodosList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.pushRoute(AddUpdateTodoRoute()),
          child: const Icon(Icons.add),
        ));
  }
}
