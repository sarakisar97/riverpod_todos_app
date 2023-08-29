// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todosRepositoryHash() => r'fae1ab7c615dd95496ef32e858f10b95029d38b2';

/// See also [todosRepository].
@ProviderFor(todosRepository)
final todosRepositoryProvider = AutoDisposeProvider<TodosRepository>.internal(
  todosRepository,
  name: r'todosRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todosRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TodosRepositoryRef = AutoDisposeProviderRef<TodosRepository>;
String _$todosHash() => r'c62798b91dd05b6fecd44327227983f4206b1fba';

/// See also [todos].
@ProviderFor(todos)
final todosProvider = AutoDisposeFutureProvider<List<Todo>>.internal(
  todos,
  name: r'todosProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TodosRef = AutoDisposeFutureProviderRef<List<Todo>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
