import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/todo_bloc.dart';
import '../bloc/todo_event.dart';
import '../data/todo_translations.dart';
import '../models/todo_model.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({
    super.key,
    required this.todo,
  });

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          context.read<TodoBloc>().add(ToggleTodoStatus(todo.id));
        },
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        title: Text(translateTodo(todo.todo)),
        subtitle: Text(
          todo.completed ? 'Статус: выполнено' : 'Статус: не выполнено',
        ),
        trailing: IconButton(
          onPressed: () {
            context.read<TodoBloc>().add(ToggleTodoStatus(todo.id));
          },
          icon: Icon(
            todo.completed
                ? Icons.check_circle
                : Icons.radio_button_unchecked,
            color: todo.completed ? Colors.green : Colors.grey,
          ),
        ),
      ),
    );
  }
}
