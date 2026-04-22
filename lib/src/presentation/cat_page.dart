import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/cat_image_cubit.dart';

class CatPage extends StatelessWidget {
  const CatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Случайная кошка'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: BlocBuilder<CatImageCubit, CatImageState>(
            builder: (context, state) {
              if (state is CatImageLoading || state is CatImageInitial) {
                return const CircularProgressIndicator();
              }

              if (state is CatImageError) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: context.read<CatImageCubit>().fetchCatImage,
                      child: const Text('Повторить'),
                    ),
                  ],
                );
              }

              if (state is CatImageLoaded) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.network(
                        state.catImage.url,
                        height: 320,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }

                          return const SizedBox(
                            height: 320,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const SizedBox(
                            height: 320,
                            child: Center(
                              child: Text('Ошибка отображения картинки'),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: context.read<CatImageCubit>().fetchCatImage,
                      child: const Text('Загрузить другую кошку'),
                    ),
                  ],
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
