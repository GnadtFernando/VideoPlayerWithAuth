import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_seventh/controllers/login_controller.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  final String? email;
  const LoginPage({Key? key, this.email}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginController = Modular.get<LoginController>();
  final _formKey = GlobalKey<FormState>();
  bool _showPass = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                size.width * 0.04, size.width * 0.8, size.width * 0.04, 0),
            child: Column(
              children: [
                TextFormField(
                  validator: Validatorless.required('Usuário obrigatório'),
                  decoration: InputDecoration(
                    hintText: "Usuário",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  controller: _loginController.userController,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: size.width * 0.04,
                ),
                TextFormField(
                  controller: _loginController.passController,
                  obscureText: _showPass,
                  validator: Validatorless.required('Senha obrigatória'),
                  decoration: InputDecoration(
                      hintText: "Senha",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _showPass = !_showPass;
                            });
                          },
                          icon: !_showPass
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off))),
                ),
                ElevatedButton(
                    onPressed: () async {
                      await _loginController.login(_formKey, context);
                    },
                    child: const Text('Login'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
