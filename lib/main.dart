import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_todos_app/riverpod_observer.dart';
import 'package:riverpod_todos_app/src/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'main.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(SharedPreferencesRef ref) {
  throw UnimplementedError();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  runApp(ProviderScope(
    observers: [RiverpodObserver()],
    overrides: [
    sharedPreferencesProvider.overrideWithValue(sharedPreferences)
  ], child: const MyApp()));
}
