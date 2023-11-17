import 'package:flutter/material.dart';
import 'package:riverpod_todos_app/src/routing/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRouter(); 
    return MaterialApp.router(

      title: 'Todos App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
      ),
      routerConfig: _appRouter.config(),
    );
  }
}