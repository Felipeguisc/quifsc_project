import 'package:flutter/material.dart';

import '../constants.dart';

class RoundedTextInput extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;

  const RoundedTextInput({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInputContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}

class RoundedPasswordInput extends StatelessWidget {
  const RoundedPasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextInputContainer(
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Senha",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}

class TextInputContainer extends StatelessWidget {
  final Widget child;

  const TextInputContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29.0),
      ),
      child: child,
    );
  }
}
