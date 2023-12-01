import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todos_app/src/features/auth/application/auth_token_controller.dart';
import 'package:riverpod_todos_app/src/features/auth/presentation/login_screen/login_screen.dart';
import 'package:riverpod_todos_app/src/features/todos/domain/todo/todo.dart';
import 'package:riverpod_todos_app/src/features/todos/presentation/add_update_todo_screen/add_update_todo_screen.dart';
import 'package:riverpod_todos_app/src/features/todos/presentation/todos_screen/todos_screen.dart';

part 'app_router.gr.dart';

part 'app_router.g.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter implements AutoRouteGuard {
  AppRouter(this._ref);

  final ProviderRef _ref;
  
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (_ref.watch(authTokenControllerProvider) != null ||
        resolver.route.name == LoginRoute.name) {
      resolver.next(true);
    } else {
      resolver.redirect(const LoginRoute());
    }
  }

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: TodosRoute.page, initial: true),
        AutoRoute(page: AddUpdateTodoRoute.page),
        AutoRoute(page: LoginRoute.page),
      ];
}

@Riverpod(keepAlive: true)
AppRouter appRouter(AppRouterRef ref) {
  return AppRouter(ref);
}
