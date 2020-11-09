import 'package:dartz/dartz.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:olga_ri/app/exceptions/login_failure.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../repository/i_login_repository.dart';
part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final ILoginRepository _repository;
  bool isTest = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @observable
  bool loading = false;

  @observable
  String nameByEmail;

  @observable
  bool validEmail;

  @observable
  bool validPassword;

  @observable
  Option<LoginFailure> failure;
  _LoginControllerBase(this._repository);

  @action
  Future<void> login() async {
    loading = true;
    failure = none();

    final loginResult = await _repository.login(
        emailController.text.toLowerCase().trim(),
        passwordController.text.trim());
    loginResult.fold((failureResult) {
      failure = optionOf(failureResult);
      loading = false;
      validPassword = false;
    }, (token) async {
      validPassword = true;
      if (isTest) {
        return;
      }
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString('access_token', token);
      loading = false;
      Modular.to.pushNamedAndRemoveUntil('/', (_) => false);
    });
  }

  @action
  validateEmail() {
    validEmail = EmailValidator.validate(emailController.text.trim());
    if (validEmail) {
      getNameByEmail();
    }
  }

  @action
  getNameByEmail() {
    //Algoritmo para pegar o nome antes do @.
    String temp = emailController.text;
    nameByEmail = temp.split('@')[0];
    nameByEmail = nameByEmail.replaceRange(0, 1, nameByEmail[0].toUpperCase());
    if (nameByEmail.contains('.')) {
      String temp0 = nameByEmail
          .split('.')[0]
          .replaceRange(0, 1, nameByEmail.split('.')[0][0].toUpperCase());
      String temp1 = nameByEmail
          .split('.')[1]
          .replaceRange(0, 1, nameByEmail.split('.')[1][0].toUpperCase());
      nameByEmail = temp0 + ' ' + temp1;
    }
  }

  recoverPassword(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 38.0, left: 12, bottom: 8),
              child: Wrap(
                children: <Widget>[
                  Text(
                    'VAMO REDEFINIR SUA SENHA?',
                    style: GoogleFonts.firaSans(
                        color: Color.fromRGBO(147, 143, 133, 1),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal,
                        fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      'Iremos te enviar as instruções de redefinição\n de senha para o e-mail abaixo, ok?',
                      style: GoogleFonts.firaSans(
                          color: Color.fromRGBO(33, 37, 41, 1),
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 45),
                    child: Text(
                      '${emailController.text.toLowerCase().trim()}',
                      style: GoogleFonts.firaSans(
                          color: Color.fromRGBO(33, 37, 41, 1),
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black12,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: GestureDetector(
                              onTap: () {
                                Modular.to.pop();
                              },
                              child: Text(
                                'CANCELAR',
                                style: GoogleFonts.firaSans(
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12,
                                    color: Color.fromRGBO(33, 37, 41, 1)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(right: 24),
                            width:
                                (MediaQuery.of(context).size.width * 0.5) - 24,
                            child: GestureDetector(
                              onTap: () async {
                                Modular.to.pushNamedAndRemoveUntil(
                                    'prelogin', (_) => false, arguments: {
                                  'showRecoverEmailMessage': true
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 56,
                                width:
                                    (MediaQuery.of(context).size.width * 0.5) -
                                        24,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(249, 202, 71, 1),
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 10,
                                          offset: Offset(0, 4),
                                          color:
                                              Color.fromRGBO(246, 203, 2, 0.2))
                                    ]),
                                child: Text(
                                  'ENVIAR',
                                  style: GoogleFonts.firaSans(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontStyle: FontStyle.normal),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  @action
  backToEmail() {
    validEmail = null;
    validPassword = null;
  }

  backToPreLogin() {
    Modular.to.pop();
  }
}
