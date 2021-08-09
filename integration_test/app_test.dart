import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_test_example/internal/application.dart';

main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Email is empty',
    (WidgetTester test) async {
      await test.pumpWidget(App());
      await test.tap(find.byType(FloatingActionButton));
      await test.pumpAndSettle();
    },
  );
}
