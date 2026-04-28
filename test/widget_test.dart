import 'package:flutter_test/flutter_test.dart';

import 'package:test2/app.dart';
import 'package:test2/data/api_service.dart';
import 'package:test2/models/todo_model.dart';

void main() {
  testWidgets('shows todo page title', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp(apiService: FakeApiService()));
    await tester.pump();

    expect(find.text('Список задач'), findsOneWidget);
  });
}

class FakeApiService extends ApiService {
  @override
  Future<List<TodoModel>> getTodos() async {
    return const [
      TodoModel(
        id: 1,
        todo: 'Test todo',
        completed: true,
        userId: 1,
      ),
    ];
  }
}
