import 'package:flutter/material.dart';
import 'package:lojavirtual/common/helpers/validator.dart';
import 'package:lojavirtual/models/user.dart';
import 'package:lojavirtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              children: <Widget>[
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: 'E-mail'),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  // ignore: missing_return
                  validator: (email) {
                    if (!emailValid(email)) return 'E-mail Inválido';
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: passController,
                  decoration: const InputDecoration(hintText: 'Senha'),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  autocorrect: false,
                  obscureText: true,
                  validator: (password) {
                    if (password.isEmpty || password.length < 6)
                      return 'Senha inválida';
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: const Text(
                        'Esqueci minha senha',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.grey[700],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        context.read<UserManager>().signIn(
                            user: Usuario(
                                email: emailController.text,
                                password: passController.text),
                            onFail: (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Falha ao entrar: $e'),
                                  backgroundColor:  Colors.grey[700],
                                  duration: Duration(seconds: 1),                                
                                ),
                              );
                            },
                            onSuccess: () {
                              print("Sucesso");
                            });
                      }
                    },
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
