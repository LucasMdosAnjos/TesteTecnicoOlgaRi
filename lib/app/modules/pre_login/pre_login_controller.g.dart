// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pre_login_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $PreLoginController = BindInject(
  (i) => PreLoginController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PreLoginController on _PreLoginControllerBase, Store {
  final _$showRecoverEmailWarningAtom =
      Atom(name: '_PreLoginControllerBase.showRecoverEmailWarning');

  @override
  bool get showRecoverEmailWarning {
    _$showRecoverEmailWarningAtom.reportRead();
    return super.showRecoverEmailWarning;
  }

  @override
  set showRecoverEmailWarning(bool value) {
    _$showRecoverEmailWarningAtom
        .reportWrite(value, super.showRecoverEmailWarning, () {
      super.showRecoverEmailWarning = value;
    });
  }

  final _$_PreLoginControllerBaseActionController =
      ActionController(name: '_PreLoginControllerBase');

  @override
  dynamic setShowRecoverEmailWarning(bool value) {
    final _$actionInfo = _$_PreLoginControllerBaseActionController.startAction(
        name: '_PreLoginControllerBase.setShowRecoverEmailWarning');
    try {
      return super.setShowRecoverEmailWarning(value);
    } finally {
      _$_PreLoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showRecoverEmailWarning: ${showRecoverEmailWarning}
    ''';
  }
}
