import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:olga_ri/app/exceptions/login_failure.dart';

import 'package:olga_ri/app/modules/login/login_controller.dart';
import 'package:olga_ri/app/modules/login/login_module.dart';

void main() {
  initModule(LoginModule());
  LoginController controller;
  
  setUp(() {
         controller = LoginModule.to.get<LoginController>();
  });

  group('LoginController Test', () {
      test("Login Efetuado com sucesso", () async {
        controller.isTest = true;
        controller.emailController.text = 'lucas@gmail.com';
        controller.passwordController.text = 'axzcyr';
        await controller.login();
        expect(controller.failure.isNone(), true);
      });
      test("Login com Credenciais Vazias", () async {
        controller.isTest = true;
        controller.emailController.text = '';
        controller.passwordController.text = '';
        await controller.login();
        expect(controller.failure.fold(() => 'teste deu errado', id), isA<LoginFailure>());
        expect(controller.failure.fold(() => 'teste deu errado', id), isA<LoginCredentialsEmpty>());

      });

      test("Login com Credenciais Erradas", () async {
        controller.isTest = true;
        controller.emailController.text = 'lucas123@gmail.com';
        controller.passwordController.text = 'password';
        await controller.login();
        expect(controller.failure.fold(() => 'teste deu errado', id), isA<LoginFailure>());
        expect(controller.failure.fold(() => 'teste deu errado', id), isA<LoginNotFoundFailure>());
      });
  });
}
