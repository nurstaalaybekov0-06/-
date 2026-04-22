import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cat_image_cubit.dart';
import 'presentation/cat_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.catImageCubit,
  });

  final CatImageCubit catImageCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: catImageCubit,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cat Image',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          scaffoldBackgroundColor: const Color(0xFFFFF8F0),
          useMaterial3: true,
        ),
        home: const CatPage(),
      ),
    );
  }
}
