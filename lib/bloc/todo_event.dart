abstract class TodoEvent {
  const TodoEvent();
}

class LoadTodos extends TodoEvent {
  const LoadTodos();
}

class ToggleTodoStatus extends TodoEvent {
  const ToggleTodoStatus(this.todoId);

  final int todoId;
}
