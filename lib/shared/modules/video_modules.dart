import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_seventh/controllers/video_controller.dart';
import 'package:teste_seventh/page/video_page.dart';

class VideoModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => VideoController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (_, args) => const VideoPage(),
            transition: TransitionType.fadeIn),
      ];
}
