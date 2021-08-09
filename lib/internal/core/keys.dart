import 'package:flutter/material.dart' show GlobalKey, NavigatorState;

/// This class contains all app specefic keys.
/// All Key objects should be created here as static final members.
class AppKeys {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
}
