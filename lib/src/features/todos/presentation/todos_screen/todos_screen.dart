import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_todos_app/src/features/todos/presentation/todos_screen/todos_list.dart';
import 'package:riverpod_todos_app/src/routing/app_router.dart';

@RoutePage()
class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todos'),
        ),
        body: const TodosList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.pushRoute(AddUpdateTodoRoute()),
          child: const Icon(Icons.add),
        ));
  }
}
