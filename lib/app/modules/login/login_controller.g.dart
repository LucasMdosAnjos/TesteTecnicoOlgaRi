// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $LoginController = BindInject(
  (i) => LoginController(i<ILoginRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$loadingAtom = Atom(name: '_LoginControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$nameByEmailAtom = Atom(name: '_LoginControllerBase.nameByEmail');

  @override
  String get nameByEmail {
    _$nameByEmailAtom.reportRead();
    return super.nameByEmail;
  }

  @override
  set nameByEmail(String value) {
    _$nameByEmailAtom.reportWrite(value, super.nameByEmail, () {
      super.nameByEmail = value;
    });
  }

  final _$validEmailAtom = Atom(name: '_LoginControllerBase.validEmail');

  @override
  bool get validEmail {
    _$validEmailAtom.reportRead();
    return super.validEmail;
  }

  @override
  set validEmail(bool value) {
    _$validEmailAtom.reportWrite(value, super.validEmail, () {
      super.validEmail = value;
    });
  }

  final _$validPasswordAtom = Atom(name: '_LoginControllerBase.validPassword');

  @override
  bool get validPassword {
    _$validPasswordAtom.reportRead();
    return super.validPassword;
  }

  @override
  set validPassword(bool value) {
    _$validPasswordAtom.reportWrite(value, super.validPassword, () {
      super.validPassword = value;
    });
  }

  final _$failureAtom = Atom(name: '_LoginControllerBase.failure');

  @override
  Option<LoginFailure> get failure {
    _$failureAtom.reportRead();
    return super.failure;
  }

  @override
  set failure(Option<LoginFailure> value) {
    _$failureAtom.reportWrite(value, super.failure, () {
      super.failure = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_LoginControllerBase.login');

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  dynamic validateEmail() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.validateEmail');
    try {
      return super.validateEmail();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getNameByEmail() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.getNameByEmail');
    try {
      return super.getNameByEmail();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic backToEmail() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.backToEmail');
    try {
      return super.backToEmail();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
nameByEmail: ${nameByEmail},
validEmail: ${validEmail},
validPassword: ${validPassword},
failure: ${failure}
    ''';
  }
}
