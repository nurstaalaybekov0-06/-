import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/api_service.dart';
import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc({required ApiService apiService})
      : _apiService = apiService,
        super(const TodoInitial()) {
    on<LoadTodos>(_onLoadTodos);
    on<ToggleTodoStatus>(_onToggleTodoStatus);
  }

  final ApiService _apiService;

  Future<void> _onLoadTodos(
    LoadTodos event,
    Emitter<TodoState> emit,
  ) async {
    emit(const TodoLoading());

    try {
      final todos = await _apiService.getTodos();
      emit(TodoLoaded(todos));
    } catch (_) {
      emit(const TodoError('Ошибка загрузки данных'));
    }
  }

  void _onToggleTodoStatus(
    ToggleTodoStatus event,
    Emitter<TodoState> emit,
  ) {
    final currentState = state;
    if (currentState is! TodoLoaded) {
      return;
    }

    final updatedTodos = currentState.todos
        .map(
          (todo) => todo.id == event.todoId
              ? todo.copyWith(completed: !todo.completed)
              : todo,
        )
        .toList();

    emit(TodoLoaded(updatedTodos));
  }
}
