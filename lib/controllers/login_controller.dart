import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:teste_seventh/services/login_service.dart';

class LoginController {
  final LoginService _loginService = LoginService();
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Future<void> login(
    GlobalKey<FormState> formKey,
    BuildContext context,
  ) async {
    Map body = {
      "username": userController.text,
      "password": passController.text,
    };

    bool validateForm = formKey.currentState?.validate() ?? false;
    if (validateForm) {
      var result = await _loginService.doLogin(body);
      if (result != null) {
        Modular.to.pushNamed('/video-page/');
      } else {
        Fluttertoast.showToast(
            msg: 'Falha ao logar, favor verificar credenciais');
      }
    }
  }
}
