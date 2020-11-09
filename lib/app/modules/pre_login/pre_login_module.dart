import 'pre_login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pre_login_page.dart';

class PreLoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $PreLoginController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => PreLoginPage(
                  showRecoverEmailMessage:
                      args.data!= null
                          ? args.data['showRecoverEmailMessage']
                          : false,
                )),
      ];

  static Inject get to => Inject<PreLoginModule>.of();
}
