import 'package:flutter/material.dart';

import 'package:integration_test_example/domain/model/user_credentials.dart';

import 'core/core.dart';

class App extends StatelessWidget {
  final UserCredentials user;
  App({this.user});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppKeys.navigatorKey,
      routes: AppRoutes.routes,
      initialRoute: user?.email != null ? AppRoutes.home : AppRoutes.auth,
      theme: AppThemes.defaultTheme,
    );
  }
}
