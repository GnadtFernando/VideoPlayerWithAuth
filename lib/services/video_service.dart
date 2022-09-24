import 'package:dio/dio.dart';
import 'package:teste_seventh/utils/local_storage.dart';

class VideoService {
  final Dio client = Dio();

  Future getVideoUrl() async {
    try {
      String url = 'https://mobiletest.seventh.com.br/video/bunny.mp4';
      String token = await LocalStorage.getLocalStorage('token');

      Map<String, dynamic> header = {
        'X-Access-Token': token,
      };
      Response response =
          await client.get(url, options: Options(headers: header));
      return response.data;
    } catch (e) {
      return null;
    }
  }
}
