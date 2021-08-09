import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:integration_test_example/domain/model/user_credentials.dart';
import 'package:integration_test_example/internal/core/core.dart'
    show AppRoutes, GlobalContext;
import 'package:integration_test_example/presentation/auth/auth_module.dart';

part 'home_module.g.dart';

class HomeModule = _HomeModule with _$HomeModule;

abstract class _HomeModule with Store {
  @observable
  UserCredentials signedUser;

  @observable
  bool _loadingState = false;

  @computed
  bool get loading => _loadingState;

  @action
  void setSignedUser(UserCredentials value) => signedUser = value;

  @action
  Future<UserCredentials> autoLogin() async {
    signedUser = await AuthModule().autoLogin();
  }

  @action
  Future<UserCredentials> logout() async {
    // Logout current user.
    await AuthModule().logout();

    // Navigate to the HomePage.
    Navigator.of(GlobalContext.value)
        .pushNamedAndRemoveUntil(AppRoutes.auth, (route) => false);
  }
}
