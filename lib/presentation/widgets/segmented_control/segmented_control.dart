import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:integration_test_example/internal/core/core.dart'
    show AppThemes;
import 'package:integration_test_example/presentation/auth/auth_module.dart';
import 'package:integration_test_example/presentation/widgets/segmented_control/segmented_control_styles.dart';

final SegmentedControlStyles _styles = SegmentedControlStyles();

class SegmentedControl extends StatelessWidget {
  final AuthModule authModule;
  const SegmentedControl({this.authModule});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      return Center(
        child: Observer(
            name: 'SegmentedControl',
            builder: (_) {
              return Stack(
                children: [
                  AnimatedPositioned(
                    left: authModule.tab == 0 ? 0 : size.maxWidth / 2,
                    duration: _styles.animationDuration,
                    curve: _styles.animationCurve,
                    child: Container(
                      height: _styles.height,
                      width: size.maxWidth / 2,
                      decoration: BoxDecoration(
                        color: AppThemes.red,
                        borderRadius: _styles.borderRadius,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: _styles.borderRadius,
                      color: Colors.grey
                          .withOpacity(_styles.buttonsBackgroundOpacity),
                    ),
                    child: Row(children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        key: const ValueKey('login_button'),
                        onTap: () => authModule.changeTabIndex(0),
                        child: Container(
                          height: _styles.height,
                          width: size.maxWidth / 2,
                          alignment: Alignment.center,
                          child: AnimatedDefaultTextStyle(
                            duration: _styles.animationDuration,
                            curve: _styles.animationCurve,
                            style: Theme.of(context)
                                .primaryTextTheme
                                .button
                                .copyWith(
                                    color: authModule.tab == 0
                                        ? AppThemes.white
                                        : AppThemes.grey),
                            child: Text(
                              'Login',
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        key: const ValueKey('signup_button'),
                        onTap: () => authModule.changeTabIndex(1),
                        child: Container(
                          height: _styles.height,
                          width: size.maxWidth / 2,
                          alignment: Alignment.center,
                          child: AnimatedDefaultTextStyle(
                            duration: _styles.animationDuration,
                            curve: _styles.animationCurve,
                            style: Theme.of(context)
                                .primaryTextTheme
                                .button
                                .copyWith(
                                    color: authModule.tab == 1
                                        ? AppThemes.white
                                        : AppThemes.grey),
                            child: Text('Sign-up'),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ],
              );
            }),
      );
    });
  }
}
