import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:integration_test_example/internal/core/core.dart'
    show AppThemes, AppRoutes;
import 'package:integration_test_example/presentation/auth/auth_module.dart';
import 'package:integration_test_example/presentation/auth/auth_styles.dart';
import 'package:integration_test_example/presentation/widgets/buttons/buttons.dart';
import 'package:integration_test_example/presentation/widgets/custom_paint/custom_paint.dart';
import 'package:integration_test_example/presentation/widgets/loading.dart';
import 'package:integration_test_example/presentation/widgets/segmented_control/segmented_control.dart';
import 'package:integration_test_example/presentation/widgets/textfields/textfield.dart';

class AuthPage extends StatelessWidget {
  final AuthModule _auth = AuthModule();
  final AuthStyles _styles = AuthStyles();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        height: window.physicalSize.height,
        child: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: CustomPaint(
            painter: AuthPageCustomPaint(),
            child: Observer(
              name: AppRoutes.auth,
              builder: (_) {
                return Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: _styles.contentPadding,
                        child: Form(
                          key: _auth.formKey,
                          child: ListView(
                            children: [
                              Divider(
                                  height: MediaQuery.of(context).size.height *
                                      _styles.dividerHeightFactor,
                                  color: AppThemes.transparent),
                              AppTextField(
                                validator: _auth.validateEmail,
                                onChanged: _auth.changeEmail,
                                hintText: 'Email',
                              ),
                              const Divider(color: AppThemes.transparent),
                              AppTextField(
                                validator: _auth.validatePassword,
                                onChanged: _auth.changePassword,
                                hintText: 'Password',
                              ),
                              const Divider(color: AppThemes.transparent),
                              SizedBox(
                                width: MediaQuery.of(context).size.width *
                                    _styles.segmentedControlWidthFactor,
                                child: SegmentedControl(authModule: _auth),
                              ),
                              AppButton(
                                child: Text(
                                  'Forgot Password',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .button
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                      ),
                                ),
                                onPressed: () {},
                              ),
                              Divider(
                                  height: MediaQuery.of(context).size.height *
                                      _styles.dividerHeightFactor,
                                  color: AppThemes.transparent),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: window.physicalSize.height * 0.035,
                      left: window.physicalSize.width * 0.02,
                      child: Text(
                        'Brand \nLogo'.toUpperCase(),
                        style: Theme.of(context)
                            .primaryTextTheme
                            .headline6
                            ?.copyWith(color: AppThemes.white),
                      ),
                    ),
                    if (_auth.loading) const Loading(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
