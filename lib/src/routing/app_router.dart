import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_todos_app/src/features/todos/domain/todo/todo.dart';
import 'package:riverpod_todos_app/src/features/todos/presentation/add_update_todo_screen/add_update_todo_screen.dart';
import 'package:riverpod_todos_app/src/features/todos/presentation/todos_screen/todos_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()      
class AppRouter extends _$AppRouter {      
   
 @override      
 List<AutoRoute> get routes => [      
    AutoRoute(page: TodosRoute.page, initial: true),
    AutoRoute(page: AddUpdateTodoRoute.page),
  ];    
}    