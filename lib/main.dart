import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/todo_bloc.dart';
import 'bloc/todo_event.dart';
import 'bloc/todo_state.dart';
import 'data/api_service.dart';

const Map<String, String> _todoTranslations = {
  'Do something nice for someone you care about':
      'Сделать что-нибудь приятное для близкого человека',
  'Memorize a poem': 'Выучить стихотворение',
  'Watch a classic movie': 'Посмотреть классический фильм',
  'Watch a documentary': 'Посмотреть документальный фильм',
  'Invest in cryptocurrency': 'Инвестировать в криптовалюту',
  'Contribute code or a monetary donation to an open-source software project':
      'Помочь open-source проекту кодом или денежным пожертвованием',
  'Plan a trip to another country': 'Спланировать поездку в другую страну',
  'Improve touch typing': 'Улучшить навык слепой печати',
  'Learn Express.js': 'Изучить Express.js',
  'Learn calligraphy': 'Изучить каллиграфию',
  'Have a photo session with some friends': 'Устроить фотосессию с друзьями',
  'Go to the gym': 'Сходить в спортзал',
};

String _translateTodo(String todo) {
  return _todoTranslations[todo] ?? todo;
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key, ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  final ApiService _apiService;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Список задач',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        scaffoldBackgroundColor: const Color(0xFFF5F7FB),
      ),
      home: BlocProvider(
        create: (_) => TodoBloc(apiService: _apiService)..add(const LoadTodos()),
        child: const TodoPage(),
      ),
    );
  }
}

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список задач'),
        centerTitle: true,
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading || state is TodoInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is TodoError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(fontSize: 18),
              ),
            );
          }

          if (state is TodoLoaded) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.todos.length,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final todo = state.todos[index];

                return Card(
                  child: ListTile(
                    onTap: () {
                      context.read<TodoBloc>().add(ToggleTodoStatus(todo.id));
                    },
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    title: Text(_translateTodo(todo.todo)),
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
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
