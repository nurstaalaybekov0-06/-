import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/todo_bloc.dart';
import 'bloc/todo_event.dart';
import 'data/api_service.dart';
import 'pages/todo_page.dart';

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
