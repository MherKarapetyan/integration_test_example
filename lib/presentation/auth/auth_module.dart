import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:integration_test_example/domain/model/user_credentials.dart';
import 'package:integration_test_example/domain/repository/user_credential_repository.dart';
import 'package:integration_test_example/internal/core/core.dart';
import 'package:integration_test_example/internal/dependencies/repository_module.dart';
part 'auth_module.g.dart';

class AuthModule = _AuthModule with _$AuthModule;

abstract class _AuthModule with Store {
  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  UserCredentialsRepository _module = RepositoryModule.storageRepository();

  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  bool _loadingState = false;

  @computed
  bool get loading => _loadingState;

  @observable
  int _tabIndex = 0;

  @computed
  int get tab => _tabIndex;

  @action
  Future<void> changeTabIndex(int value) async {
    if (value == _tabIndex) {
      if (value == 0)
        await login();
      else if (value == 1) await register();
    }

    _tabIndex = value;
  }

  @action
  void changeEmail(String value) => email = value;

  @action
  void changePassword(String value) => password = value;

  @action
  String validateEmail(String _) => Validators().email(email);

  @action
  String validatePassword(String _) => Validators().password(password);

  @action
  bool validateForm() => formKey.currentState?.validate() ?? false;

  @action
  Future<bool> register() async {
    bool _loggedIn = false;

    if (validateForm()) {
      _loadingState = true;
      await Future.delayed(Duration(seconds: 2));
      UserCredentials _user =
          await _module?.setEmailAndPassword(email: email, password: password);
      _loggedIn = (_user?.email?.isNotEmpty ?? false) &&
          (_user?.password?.isNotEmpty ?? false);
    }
    if (_loggedIn) navigateToHome();

    _loadingState = false;
    return false;
  }

  @action
  Future<bool> login() async {
    bool _loggedIn = false;
    if (validateForm()) {
      _loadingState = true;
      await Future.delayed(Duration(seconds: 1));
      UserCredentials _user =
          await _module?.login(email: email, password: password);
      _loggedIn = (_user?.email?.isNotEmpty ?? false) &&
          (_user?.password?.isNotEmpty ?? false);
    }

    if (_loggedIn) navigateToHome();

    _loadingState = false;

    return _loggedIn;
  }

  @action
  void navigateToHome() {
    Future.delayed(Duration(milliseconds: 300), () {
      Navigator.of(GlobalContext.value)
          .pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
    });
  }

  @action
  void navigateToAuth() {
    Navigator.of(GlobalContext.value)
        .pushNamedAndRemoveUntil(AppRoutes.auth, (route) => false);
  }

  @action
  Future<bool> logout() async {
    UserCredentials _user = await _module?.logout();

    bool _loggedOut =
        (_user?.email?.isEmpty ?? false) && (_user?.password?.isEmpty ?? false);
    if (_loggedOut) navigateToAuth();

    return _loggedOut;
  }

  @action
  Future<UserCredentials> autoLogin() async =>
      await _module?.checkSignedUser();
}
