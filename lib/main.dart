import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todos_app/src/app.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}