import 'package:dio/dio.dart';

import '../models/cat_image_model.dart';

class CatApiService {
  CatApiService({Dio? dio})
      : _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: 'https://api.thecatapi.com/v1',
                connectTimeout: const Duration(seconds: 10),
                receiveTimeout: const Duration(seconds: 10),
              ),
            );

  final Dio _dio;

  Future<CatImageModel> getCatImage() async {
    final response = await _dio.get<List<dynamic>>('/images/search');
    final data = response.data;

    if (data == null || data.isEmpty) {
      throw Exception('Cat image not found');
    }

    return CatImageModel.fromJson(data.first as Map<String, dynamic>);
  }
}
