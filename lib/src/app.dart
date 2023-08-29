import 'package:flutter/material.dart';
import 'package:riverpod_todos_app/src/features/todos/presentation/todos_screen/todos_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todos App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: const TodosScreen(),
    );
  }
}