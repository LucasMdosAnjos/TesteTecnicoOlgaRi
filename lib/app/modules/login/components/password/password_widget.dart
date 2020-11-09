import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../login_controller.dart';

class PasswordWidget extends StatelessWidget {
  final LoginController controller;

  const PasswordWidget({Key key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 16),
                child: Container(
                    alignment: Alignment.center,
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(221, 216, 194, 1),
                        shape: BoxShape.circle),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                      onPressed: controller.backToEmail,
                    )),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Observer(
                  builder: (_) => RichText(
                      text: TextSpan(
                          text:
                              'Olá ${controller.nameByEmail} :)\nAgora insira sua ',
                          style: GoogleFonts.firaSans(
                              color: Color.fromRGBO(33, 37, 41, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal),
                          children: [
                        TextSpan(
                          text: 'senha',
                          style: GoogleFonts.firaSans(
                              color: Color.fromRGBO(33, 37, 41, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal),
                        ),
                      ])),
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  children: [
                    Observer(
                      builder: (_) => Row(
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width - 16) *
                                ((controller.validPassword == null ||
                                        controller.validPassword)
                                    ? 1
                                    : 0.85),
                            child: TextFormField(
                              controller: controller.passwordController,
                              obscureText: true,
                              style: GoogleFonts.firaSans(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18,
                                  color: Color.fromRGBO(33, 37, 41, 1),
                                  fontWeight: FontWeight.w400),
                              decoration: InputDecoration(
                                  hintText: 'Digite aqui',
                                  border: InputBorder.none,
                                  hintStyle: GoogleFonts.firaSans(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ),
                          (controller.validPassword != null &&
                                  !controller.validPassword)
                              ? Icon(
                                  Icons.error,
                                  size: 36,
                                  color: Color.fromRGBO(255, 95, 0, 1),
                                )
                              : Container()
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Observer(
                        builder: (_) => (controller.validPassword != null &&
                                !controller.validPassword)
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      'SENHA INVÁLIDA. TENTE DE NOVO',
                                      style: GoogleFonts.firaSans(
                                          fontStyle: FontStyle.normal,
                                          color: Color.fromRGBO(253, 91, 42, 1),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    )),
                              )
                            : Container()),
                  ],
                ),
              ),
              //SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: GestureDetector(
                  onTap: () {
                    controller.recoverPassword(context);
                  },
                  child: Text(
                    'Esqueci minha senha',
                    style: GoogleFonts.firaSans(
                        decoration: TextDecoration.underline,
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 74,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Container(
                          height: 2,
                          width: MediaQuery.of(context).size.width,
                          color: Color.fromRGBO(246, 203, 2, 1),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: GestureDetector(
                                      onTap: controller.backToEmail,
                                      child: Text(
                                        'ANTERIOR',
                                        style: GoogleFonts.firaSans(
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12,
                                            color:
                                                Color.fromRGBO(33, 37, 41, 1)),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(right: 24),
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: GestureDetector(
                                      onTap: controller.login,
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 56,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(249, 202, 71, 1),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 10,
                                                  offset: Offset(0, 4),
                                                  color: Color.fromRGBO(
                                                      246, 203, 2, 0.2))
                                            ]),
                                        child: Text(
                                          'ENTRAR',
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
                              SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
