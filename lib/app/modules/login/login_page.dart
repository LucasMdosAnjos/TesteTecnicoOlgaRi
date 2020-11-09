
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:olga_ri/app/exceptions/login_failure.dart';
import 'package:olga_ri/app/modules/login/components/email/email_widget.dart';
import 'package:olga_ri/app/modules/login/components/password/password_widget.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  void initState() {
    super.initState();
    reaction((_) => controller.failure, (_) {
      controller.failure.map((failure) {
        //Caso de erro map é disparado
        String message;
        if (failure is LoginNotFoundFailure) {
          message = 'Login ou senha inválidos.';
          
        } else if (failure is LoginCredentialsEmpty) {
          message = 'Email ou senha estão vazios.';
        } else {
          message = 'Erro ao realizar Login';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
          onWillPop: () async{
            if(controller.validEmail!=null && controller.validEmail){
              controller.backToEmail();
              return false;
            }else{
              return true;
            }
          },
          child: Scaffold(
          body: Observer(
        builder: (_) => controller.validEmail == null || !controller.validEmail
            ? EmailWidget(
                controller: controller,
              )
            : PasswordWidget(
                controller: controller,
              ),
      )),
    );
  }
}
