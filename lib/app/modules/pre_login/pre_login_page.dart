import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:olga_ri/app/modules/pre_login/components/recoverPasswordWarning/recover_password_warning_widget.dart';
import 'pre_login_controller.dart';

class PreLoginPage extends StatefulWidget {
  final String title;
  final bool showRecoverEmailMessage;
  const PreLoginPage({
    Key key,
    this.title = "PreLogin",
    this.showRecoverEmailMessage = false,
  }) : super(key: key);

  @override
  _PreLoginPageState createState() => _PreLoginPageState();
}

class _PreLoginPageState
    extends ModularState<PreLoginPage, PreLoginController> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 10)).then((_) {
      if (widget.showRecoverEmailMessage) {
        controller.setShowRecoverEmailWarning(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.5,
                      color: Color.fromRGBO(241, 239, 231, 1),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.31,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'images/frango_pesto_parm.png'),
                                    fit: BoxFit.cover)),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                width: MediaQuery.of(context).size.width * 0.32,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage('images/logo_olga.png'),
                                        fit: BoxFit.contain)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'VAMO DE SALADA?',
                              style: GoogleFonts.firaSans(
                                  color: Color.fromRGBO(147, 143, 133, 1),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Falta pouco para você matar sua\n fome de Olga Ri ;)',
                              style: GoogleFonts.firaSans(
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            GestureDetector(
                              onTap: controller.goToLogin,
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                height: 56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(246, 203, 2, 0.2),
                                        blurRadius: 10,
                                        offset: Offset(0, 4))
                                  ],
                                  color: Color.fromRGBO(249, 202, 7, 1),
                                ),
                                child: Text(
                                  'ENTRAR',
                                  style: GoogleFonts.firaSans(
                                      color: Colors.white,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Text(
                              'Ou entre com:',
                              style: GoogleFonts.firaSans(
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              height: 56,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  imageIcon('images/google.png'),
                                  imageIcon('images/facebook.png'),
                                  imageIcon('images/apple.png'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                    // TextFormField(
                    //   controller: controller.emailController,
                    //   decoration: InputDecoration(labelText: 'Email'),
                    // ),
                    // TextFormField(
                    //   controller: controller.passwordController,
                    //   decoration: InputDecoration(labelText: 'Password'),
                    // ),
                    // RaisedButton(
                    //   child: Text('Login'),
                    //   onPressed: controller.login,
                    // )
                  ],
                )),
            Observer(
                builder: (_) => controller.showRecoverEmailWarning
                    ? RecoverPasswordWarningWidget(
                        controller: controller,
                      )
                    : Container()),
          ],
        ),
      ),
    );
  }

  Widget imageIcon(String source) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.18,
      decoration:
          BoxDecoration(image: DecorationImage(image: AssetImage(source))),
    );
  }
}
