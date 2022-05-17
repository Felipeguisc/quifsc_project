import 'package:flutter/material.dart';

import '../constants.dart';

class RoundedTextInput extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController? controller;

  const RoundedTextInput({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextInputContainer(
      child: TextField(
        controller: controller,
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

class RoundedPasswordInput extends StatefulWidget {
  final TextEditingController? controller;
  bool obscure;

  RoundedPasswordInput({
    Key? key,
    this.controller,
    this.obscure = true,
  }) : super(key: key);

  @override
  State<RoundedPasswordInput> createState() => _RoundedPasswordInputState();
}

class _RoundedPasswordInputState extends State<RoundedPasswordInput> {
  @override
  Widget build(BuildContext context) {
    return TextInputContainer(
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscure,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Senha",
          icon: const Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: _iconEyes(),
          ),
        ),
      );
  }

  GestureDetector _iconEyes() {
    var icon =
    widget.obscure ?  Icons.remove_red_eye_rounded : Icons.remove_red_eye_outlined;
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.obscure = !widget.obscure;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(0),
        height: 22,
        width: 25,
        child: Icon(icon, size: 20, color: Colors.grey,),
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
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29.0),
      ),
      child: child,
    );
  }
}
