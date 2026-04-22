import 'package:flutter_test/flutter_test.dart';
import 'package:lesson_1/app.dart';

void main() {
  testWidgets('Marketplace home screen renders key sections', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MarketplaceApp());

    expect(find.text('Категории'), findsOneWidget);
    expect(find.text('Рекомендации'), findsOneWidget);
    expect(find.text('Наушники Beats by Dre'), findsWidgets);
  });
}
