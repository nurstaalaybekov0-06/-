import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/data/api/cat_api_service.dart';
import 'src/logic/cat_image_cubit.dart';

void main() {
  final catApiService = CatApiService();

  runApp(
    MyApp(
      catImageCubit: CatImageCubit(catApiService)..fetchCatImage(),
    ),
  );
}
