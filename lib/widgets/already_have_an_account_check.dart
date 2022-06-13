import 'package:flutter/material.dart';

import '../constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function() onPress;

  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Ainda não tem uma conta? " : "Já tem uma conta? ",
          style: const TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
            onTap: onPress,
            child: Text(
              login ? "Criar conta!" : "Entrar!",
              style:
                  const TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}
