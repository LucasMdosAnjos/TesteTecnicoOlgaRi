import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'pre_login_controller.g.dart';

@Injectable()
class PreLoginController = _PreLoginControllerBase with _$PreLoginController;

abstract class _PreLoginControllerBase with Store {
  @observable
  bool showRecoverEmailWarning = false;

  void goToLogin() {
    Modular.to.pushNamed('login');
  }

  @action
  setShowRecoverEmailWarning(bool value) {
    showRecoverEmailWarning = value;
    if (showRecoverEmailWarning) {
      Future.delayed(Duration(seconds: 5)).then((value) {
        setShowRecoverEmailWarning(false);
      });
    }
  }
}
