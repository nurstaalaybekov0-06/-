import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/api/cat_api_service.dart';
import '../data/models/cat_image_model.dart';

sealed class CatImageState {
  const CatImageState();
}

final class CatImageInitial extends CatImageState {
  const CatImageInitial();
}

final class CatImageLoading extends CatImageState {
  const CatImageLoading();
}

final class CatImageLoaded extends CatImageState {
  const CatImageLoaded(this.catImage);

  final CatImageModel catImage;
}

final class CatImageError extends CatImageState {
  const CatImageError(this.message);

  final String message;
}

class CatImageCubit extends Cubit<CatImageState> {
  CatImageCubit(this._catApiService) : super(const CatImageInitial());

  final CatApiService _catApiService;

  Future<void> fetchCatImage() async {
    emit(const CatImageLoading());

    try {
      final catImage = await _catApiService.getCatImage();
      emit(CatImageLoaded(catImage));
    } catch (_) {
      emit(const CatImageError('Не удалось загрузить картинку кошки'));
    }
  }
}
