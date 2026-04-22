// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lesson_2/src/app.dart';
import 'package:lesson_2/src/data/models/cat_image_model.dart';
import 'package:lesson_2/src/logic/cat_image_cubit.dart';

void main() {
  testWidgets('shows loaded cat page content', (WidgetTester tester) async {
    final cubit = FakeCatImageCubit();

    await tester.pumpWidget(MyApp(catImageCubit: cubit));
    await tester.pump();

    expect(find.text('Случайная кошка'), findsOneWidget);
    expect(find.text('Загрузить другую кошку'), findsOneWidget);
  });
}

class FakeCatImageCubit extends Cubit<CatImageState> implements CatImageCubit {
  FakeCatImageCubit()
      : super(
          const CatImageLoaded(
            CatImageModel(
              id: '1',
              url: 'https://cdn2.thecatapi.com/images/test.jpg',
            ),
          ),
        );

  @override
  Future<void> fetchCatImage() async {}
}
