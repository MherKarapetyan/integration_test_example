import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_test_example/internal/application.dart';
import 'package:integration_test_example/presentation/auth/auth.dart';
import 'package:integration_test_example/presentation/home/home.dart';

import 'helpers.dart';

main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Generating a random email and password.
  String _email = Generate.email();
  String _password = '${_email}1';

  testWidgets(
    'Should Signup the user with test credentials \nEmail is |-- $_email \nPassword is |-- $_password ',
    (WidgetTester test) async {
      await test.pumpWidget(App());

      // Get text editing widgets.
      final Finder _emailFinder = find.byKey(ValueKey('email_textfield'));
      final Finder _passwordFinder = find.byKey(ValueKey('password_textfield'));

      // Fill generated email and password into fields.
      await test.enterText(_emailFinder, _email);
      await test.enterText(_passwordFinder, _password);

      // Change Tab.
      await test.tap(find.byKey(ValueKey('signup_button')));

      // Call signup functionality.
      await test.tap(find.byKey(ValueKey('signup_button')));

      // Wait for animations to complete
      await test.pumpAndSettle(Duration(seconds: 1));

      // Find expected Widgets and texts.
      expect(find.byType(HomePage), findsOneWidget);
      expect(find.text('User regitered successfully.'), findsOneWidget);
      expect(find.byType(AuthPage), findsNothing);
      expect(find.text(_email), findsOneWidget);
    },
  );

  testWidgets(
    'Should Login the user with test credentials  \nEmail is |-- $_email \nPassword is |-- $_password ',
    (WidgetTester test) async {
      await test.pumpWidget(App());

      // Get text editing widgets.
      final Finder _emailFinder = find.byKey(ValueKey('email_textfield'));
      final Finder _passwordFinder = find.byKey(ValueKey('password_textfield'));

      // Fill generated email and password into fields.
      await test.enterText(_emailFinder, _email);
      await test.enterText(_passwordFinder, _password);

      // Change Tab.
      await test.tap(find.byKey(ValueKey('login_button')));

      // Call signup functionality.
      await test.tap(find.byKey(ValueKey('login_button')));

      // Wait for animations to complete
      await test.pumpAndSettle(Duration(seconds: 1));

      // Fing expected Widgets and texts.
      expect(find.byType(AuthPage), findsNothing);
      expect(find.text(_email), findsOneWidget);
      expect(find.byType(HomePage), findsOneWidget);
    },
  );
}
