import 'package:dio/dio.dart';

import '../models/todo_model.dart';

class ApiService {
  ApiService({Dio? dio}) : _dio = dio ?? Dio();

  final Dio _dio;

  Future<List<TodoModel>> getTodos() async {
    final response = await _dio.get('https://dummyjson.com/todos');
    final data = response.data as Map<String, dynamic>;
    final todosJson = data['todos'] as List<dynamic>;

    return todosJson
        .map((todo) => TodoModel.fromJson(todo as Map<String, dynamic>))
        .toList();
  }
}
