import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../constants.dart';

class PinInput extends StatelessWidget {
  final TextEditingController controller;

  const PinInput({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PinCodeTextField(
      appContext: context,
      length: 5,
      onChanged: (value) {
        print(value);
      },
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        fieldHeight: size.width / 6,
        fieldWidth: size.width / 6,
        borderWidth: 5,
        activeColor: Colors.purple,
        selectedColor: Colors.purpleAccent,
        activeFillColor: kPrimaryLightColor,
        selectedFillColor: kPrimaryLightColor,
        disabledColor: kPrimaryLightColor,
        inactiveColor: kPrimaryLightColor,
        inactiveFillColor: kPrimaryLightColor,
      ),
      controller: controller,
      backgroundColor: Colors.transparent,
      obscureText: false,
      autoDismissKeyboard: true,
      autoFocus: true,
      enableActiveFill: true,
      showCursor: false,
      keyboardType: TextInputType.number,
      textStyle: TextStyle(fontSize: 40),
    );
  }
}