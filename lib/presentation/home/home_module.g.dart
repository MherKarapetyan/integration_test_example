// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_module.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeModule on _HomeModule, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_HomeModule.loading'))
      .value;

  final _$signedUserAtom = Atom(name: '_HomeModule.signedUser');

  @override
  UserCredentials get signedUser {
    _$signedUserAtom.reportRead();
    return super.signedUser;
  }

  @override
  set signedUser(UserCredentials value) {
    _$signedUserAtom.reportWrite(value, super.signedUser, () {
      super.signedUser = value;
    });
  }

  final _$_loadingStateAtom = Atom(name: '_HomeModule._loadingState');

  @override
  bool get _loadingState {
    _$_loadingStateAtom.reportRead();
    return super._loadingState;
  }

  @override
  set _loadingState(bool value) {
    _$_loadingStateAtom.reportWrite(value, super._loadingState, () {
      super._loadingState = value;
    });
  }

  final _$autoLoginAsyncAction = AsyncAction('_HomeModule.autoLogin');

  @override
  Future<UserCredentials> autoLogin() {
    return _$autoLoginAsyncAction.run(() => super.autoLogin());
  }

  final _$logoutAsyncAction = AsyncAction('_HomeModule.logout');

  @override
  Future<UserCredentials> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$_HomeModuleActionController = ActionController(name: '_HomeModule');

  @override
  void setSignedUser(UserCredentials value) {
    final _$actionInfo = _$_HomeModuleActionController.startAction(
        name: '_HomeModule.setSignedUser');
    try {
      return super.setSignedUser(value);
    } finally {
      _$_HomeModuleActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
signedUser: ${signedUser},
loading: ${loading}
    ''';
  }
}
