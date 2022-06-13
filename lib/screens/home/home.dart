import 'package:flutter/material.dart';
import 'package:login_project/constants.dart';
import 'package:login_project/screens/question/question.dart';
import 'package:login_project/screens/quiz/quiz_home.dart';
import 'package:provider/provider.dart';

import '../../services/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: size.height * 0.15,
              decoration: const BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(400, 40),
                    bottomRight: Radius.elliptical(400, 200)),
              ),
              child: Center(
                child: Text(
                  "Bem Vindo(a) " +
                      (context.read<AuthService>().user?.displayName ??
                          "Player"),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _FeatureItem(
              'Criar Quiz',
              Icons.quiz,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return QuizHomePage();
                }));
              },
            ),
            _FeatureItem(
              'Cadastrar Perguntas',
              Icons.question_answer_rounded,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const QuestionPage();
                }));
              },
            ),
            _FeatureItem(
              'Configurações',
              Icons.app_settings_alt_rounded,
              onTap: () {},
            ),
            _FeatureItem(
              "Sair",
              Icons.power_settings_new,
              onTap: () async {
                await context.read<AuthService>().signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onTap;

  _FeatureItem(this.label, this.icon, {required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => onTap(),
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 100,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                  size: 50,
                ),
                Text(
                  label,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
