import 'package:flutter/material.dart';
import 'package:integration_test_example/internal/core/themes.dart';

import '../../internal/core/global_context.dart';

class Snackbars {
  void showMessage({String text}) {
    final snackBar = SnackBar(
      content: Text(
        text,
        style:
            Theme.of(GlobalContext.value).primaryTextTheme.headline6?.copyWith(
                  color: AppThemes.white,
                ),
      ),
      duration: Duration(seconds: 3),
      backgroundColor: AppThemes.red,
    );
    // Asd1@asd.com

    ScaffoldMessenger.of(GlobalContext.value).showSnackBar(snackBar);
  }
}
