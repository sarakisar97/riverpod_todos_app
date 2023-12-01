import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todos_app/src/features/todos/domain/todo/todo.dart';
import 'package:riverpod_todos_app/src/features/todos/presentation/todos_controller/todos_controller.dart';

@RoutePage()
class AddUpdateTodoScreen extends ConsumerStatefulWidget {
  const AddUpdateTodoScreen({super.key, this.todo});
  final Todo? todo;

  @override
  ConsumerState<AddUpdateTodoScreen> createState() =>
      _AddUpdateTodoScreenState();
}

class _AddUpdateTodoScreenState extends ConsumerState<AddUpdateTodoScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _title;
  String? _body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_todoTitle),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                initialValue: widget.todo?.title,
                decoration: const InputDecoration(
                  hintText: 'Title',
                ),
                validator: _todoValidator,
                onSaved: (value) => _title = value,
              ),
              const SizedBox(height: 10),
              TextFormField(
                initialValue: widget.todo?.body,
                decoration: const InputDecoration(
                  hintText: 'Body',
                ),
                validator: _todoValidator,
                onSaved: (value) => _body = value,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (widget.todo == null) {
                      ref.read(todosControllerProvider.notifier).add(Todo(
                          title: _title!, body: _body!, userId: 1, id: 8888));
                    } else {
                      ref
                          .read(todosControllerProvider.notifier)
                          .updateTodo(Todo(
                            id: widget.todo!.id,
                            title: _title!,
                            body: _body!,
                            userId: 1,
                          ));
                    }
                    context.popRoute();
                  }
                },
                child: Text(_todoTitle),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String get _todoTitle => '${widget.todo == null ? 'Add' : 'Update'} Todo';

  String? _todoValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }
}
