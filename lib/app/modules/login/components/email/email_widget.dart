import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:olga_ri/app/modules/login/login_controller.dart';

class EmailWidget extends StatelessWidget {
  final LoginController controller;

  const EmailWidget({Key key, this.controller}) : super(key: key);
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
                      onPressed: controller.backToPreLogin,
                    )),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: RichText(
                    text: TextSpan(
                        text: 'Para começar,\nqual o seu ',
                        style: GoogleFonts.firaSans(
                            color: Color.fromRGBO(33, 37, 41, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal),
                        children: [
                      TextSpan(
                        text: 'e-mail',
                        style: GoogleFonts.firaSans(
                            color: Color.fromRGBO(33, 37, 41, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal),
                      ),
                      TextSpan(
                        text: '?',
                        style: GoogleFonts.firaSans(
                            color: Color.fromRGBO(33, 37, 41, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal),
                      ),
                    ])),
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
                                ((controller.validEmail == null ||
                                        controller.validEmail)
                                    ? 1
                                    : 0.85),
                            child: TextFormField(
                              controller: controller.emailController,
                              style: GoogleFonts.firaSans(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 18,
                                  color: Color.fromRGBO(33, 37, 41, 1),
                                  fontWeight: FontWeight.w400),
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  hintText: 'Digite aqui',
                                  border: InputBorder.none,
                                  hintStyle: GoogleFonts.firaSans(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ),
                          (controller.validEmail != null &&
                                  !controller.validEmail)
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
                        builder: (_) => (controller.validEmail != null &&
                                !controller.validEmail)
                            ? Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  'EMAIL INVÁLIDO. TENTE DE NOVO',
                                  style: GoogleFonts.firaSans(
                                      fontStyle: FontStyle.normal,
                                      color: Color.fromRGBO(253, 91, 42, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ))
                            : Container()),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 74,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 2,
                              width: MediaQuery.of(context).size.width * 0.2,
                              color: Color.fromRGBO(246, 203, 2, 1),
                            ),
                            Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width * 0.8,
                              color: Colors.black12,
                            )
                          ],
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
                                      onTap: controller.backToPreLogin,
                                      child: Text(
                                        'CANCELAR',
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
                                      onTap: controller.validateEmail,
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
                                          'PRÓXIMO',
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
