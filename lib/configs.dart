import 'package:flutter/material.dart' show runApp;
import 'package:flutter/services.dart'
    show SystemChrome, SystemUiOverlayStyle, Brightness;
import 'package:flutter/widgets.dart' show WidgetsFlutterBinding;
import 'package:integration_test_example/internal/application.dart';
import 'package:integration_test_example/presentation/auth/auth_module.dart';

class Configs {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Set statusbar color.
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
    );

    // Run flutter app and send logged user as argument.
    runApp(App(user: await AuthModule().autoLogin()));
  }
}
