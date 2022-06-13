import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_project/widgets/already_have_an_account_check.dart';
import 'package:login_project/widgets/rounded_button.dart';
import 'package:login_project/widgets/rounded_text_input.dart';
import 'package:login_project/constants.dart';
import 'package:login_project/screens/login/login.dart';
import 'package:provider/provider.dart';

import '../../widgets/or_divider.dart';
import '../../services/auth.dart';
import '../home/home.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {

  Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _psswdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              controller: _nameController,
              hintText: "Seu nome/apelido",
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
                register();
              },
            ),
            SizedBox(
              height: size.height * 0.035,
            ),
            AlreadyHaveAnAccountCheck(
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginPage();
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

  register() async{
    try{
      await context.read<AuthService>().signUpWithEmailAndPassword(_emailController.text, _psswdController.text, _nameController.text);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const HomePage();
      }));
    } on AuthException catch(e){
      //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Falha ao cadastrar usuário'),
            content: Text(e.message),
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
