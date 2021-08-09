import 'package:flutter/material.dart' show BuildContext;

import 'keys.dart';

class GlobalContext {
  static BuildContext get value =>
      AppKeys.navigatorKey.currentState?.overlay?.context;
}
