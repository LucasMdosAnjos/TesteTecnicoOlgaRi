import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../pre_login_controller.dart';

class RecoverPasswordWarningWidget extends StatelessWidget {
  final PreLoginController controller;

  const RecoverPasswordWarningWidget({Key key, this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
      child: GestureDetector(
        onTap: () {
          controller.setShowRecoverEmailWarning(false);
        },
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 66,
          decoration: BoxDecoration(
              color: Color.fromRGBO(0, 165, 106, 1),
              borderRadius: BorderRadius.circular(100)),
          child: Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Container(
                width: 31,
                height: 31,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2)),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                'Te enviamos um e-mail ;)',
                style: GoogleFonts.firaSans(
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }
}
