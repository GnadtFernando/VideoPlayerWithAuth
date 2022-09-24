import 'package:fluttertoast/fluttertoast.dart';
import 'package:teste_seventh/services/video_service.dart';

class VideoController {
  final VideoService _videoService = VideoService();
  String url = '';
  bool loadingCompleted = false;

  Future getUrl() async {
    await _videoService.getVideoUrl().then((value) {
      url = value['url'];
      return url;
    }).catchError((onError) {
      Fluttertoast.showToast(msg: 'Erro ao carregar url');
      return '';
    });
  }
}
