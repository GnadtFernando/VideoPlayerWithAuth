import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_seventh/controllers/login_controller.dart';
import 'package:teste_seventh/page/login_page.dart';
import 'package:teste_seventh/shared/modules/video_modules.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const LoginPage()),
        //MODULES FILHOS
        ModuleRoute('/video-page',
            module: VideoModule(), transition: TransitionType.fadeIn),
      ];
}
