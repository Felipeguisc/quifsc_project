import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_project/components/already_have_an_account_check.dart';
import 'package:login_project/components/rounded_button.dart';
import 'package:login_project/components/rounded_text_input.dart';
import 'package:login_project/constants.dart';
import 'package:login_project/screens/login/login.dart';

import '../../components/or_divider.dart';
import '../../services/auth.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
              "CRIAR CONTA",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.0,
            ),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedTextInput(
              controller: _emailController,
              hintText: "Seu melhor e-mail",
            ),
            RoundedPasswordInput(
              controller: _psswdController,
            ),
            RoundedButton(
              text: "CRIAR CONTA",
              onPress: () {
                auth.signUpWithEmailAndPassword(
                    'sarinhaproplayer@gmail.com', '123456');
              },
            ),
            SizedBox(
              height: size.height * 0.035,
            ),
            AlreadyHaveAnAccountCheck(
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
              login: false,
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialButton(
                  srcIcon: "assets/icons/facebook.svg",
                  onPress: () {},
                ),
                SocialButton(
                  srcIcon: "assets/icons/twitter.svg",
                  onPress: () {},
                ),
                SocialButton(
                  srcIcon: "assets/icons/google-plus.svg",
                  onPress: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String srcIcon;
  final Function() onPress;

  const SocialButton({
    Key? key,
    required this.srcIcon,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: kPrimaryLightColor,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          srcIcon,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("assets/images/signup_top.png",
                width: size.width * 0.35),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset("assets/images/main_bottom.png"),
          ),
          child,
        ],
      ),
    );
  }
}
