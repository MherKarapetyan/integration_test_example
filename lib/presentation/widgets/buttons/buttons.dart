import 'package:flutter/material.dart';
import 'package:integration_test_example/internal/core/core.dart' show AppThemes;

class AppButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  AppButton({
    Key key,
    this.onPressed,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: MaterialButton(
        onPressed: onPressed,
        elevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        child: child,
        color: AppThemes.darkBlue,
        splashColor: AppThemes.transparent,
        highlightColor: AppThemes.transparent,
      ),
    );
  }
}
