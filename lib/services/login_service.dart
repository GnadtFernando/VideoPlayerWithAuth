import 'dart:convert';

import 'package:dio/dio.dart';
import '../../utils/local_storage.dart';

class LoginService {
  final Dio client = Dio();
  Future<dynamic> doLogin(Map body) async {
    String url = 'https://mobiletest.seventh.com.br/login';
    try {
      Response response = await client.post(
        url,
        data: json.encode(body),
      );
      await LocalStorage.saveLocalStorage('token', response.data['token']);
      return response.data;
    } catch (e) {
      return null;
    }
  }
}
