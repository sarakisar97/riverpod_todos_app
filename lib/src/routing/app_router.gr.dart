// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddUpdateTodoRoute.name: (routeData) {
      final args = routeData.argsAs<AddUpdateTodoRouteArgs>(
          orElse: () => const AddUpdateTodoRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddUpdateTodoScreen(
          key: args.key,
          todo: args.todo,
        ),
      );
    },
    TodosRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TodosScreen(),
      );
    },
  };
}

/// generated route for
/// [AddUpdateTodoScreen]
class AddUpdateTodoRoute extends PageRouteInfo<AddUpdateTodoRouteArgs> {
  AddUpdateTodoRoute({
    Key? key,
    Todo? todo,
    List<PageRouteInfo>? children,
  }) : super(
          AddUpdateTodoRoute.name,
          args: AddUpdateTodoRouteArgs(
            key: key,
            todo: todo,
          ),
          initialChildren: children,
        );

  static const String name = 'AddUpdateTodoRoute';

  static const PageInfo<AddUpdateTodoRouteArgs> page =
      PageInfo<AddUpdateTodoRouteArgs>(name);
}

class AddUpdateTodoRouteArgs {
  const AddUpdateTodoRouteArgs({
    this.key,
    this.todo,
  });

  final Key? key;

  final Todo? todo;

  @override
  String toString() {
    return 'AddUpdateTodoRouteArgs{key: $key, todo: $todo}';
  }
}

/// generated route for
/// [TodosScreen]
class TodosRoute extends PageRouteInfo<void> {
  const TodosRoute({List<PageRouteInfo>? children})
      : super(
          TodosRoute.name,
          initialChildren: children,
        );

  static const String name = 'TodosRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
