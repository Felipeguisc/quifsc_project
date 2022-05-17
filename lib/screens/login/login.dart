import 'package:login_project/components/rounded_button.dart';
import 'package:login_project/components/rounded_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_project/services/auth.dart';

import '../../components/already_have_an_account_check.dart';
import '../home/home.dart';
import '../signup/signup.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _psswdController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthService auth = AuthService();
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedTextInput(
              hintText: "Seu e-mail",
              controller: _emailController,
            ),
            RoundedPasswordInput(
              controller: _psswdController,
            ),
            RoundedButton(
              text: "ENTRAR",
              onPress: () {
                auth
                    .signInEmailAndPass(
                        _emailController.text, _psswdController.text)
                    .then((value) {
                  if (value != null) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return const Home();
                    }));
                  } else {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: const Text('Falha no Login'),
                          content: const Text('Usuário ou senha inválidos!'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                      barrierDismissible: true,
                    );
                  }
                });
              },
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccountCheck(
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SignUpScreen();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_top.png",
              width: size.width * 0.35,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/images/login_bottom.png",
              width: size.width * 0.45,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
