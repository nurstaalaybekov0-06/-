import '../models/todo_model.dart';

abstract class TodoState {
  const TodoState();
}

class TodoInitial extends TodoState {
  const TodoInitial();
}

class TodoLoading extends TodoState {
  const TodoLoading();
}

class TodoLoaded extends TodoState {
  const TodoLoaded(this.todos);

  final List<TodoModel> todos;
}

class TodoError extends TodoState {
  const TodoError(this.message);

  final String message;
}
