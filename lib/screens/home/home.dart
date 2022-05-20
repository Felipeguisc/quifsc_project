import 'package:flutter/material.dart';
import 'package:login_project/constants.dart';
import 'package:login_project/screens/question/question.dart';
import 'package:provider/provider.dart';

import '../../services/auth.dart';
import '../quiz/quiz.dart';

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
                borderRadius:
                BorderRadius.only(bottomLeft: Radius.elliptical(400,40), bottomRight: Radius.elliptical(400,200)),
              ),
              child: Center(child: Text('QUIFSC')),
            ),
            SizedBox(height: 20,),
            _FeatureItem(
              'Criar Quiz',
              Icons.quiz,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyHomePage(title: 'Teste',);
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
              onTap: () { },
            ),
            _FeatureItem(
              context.read<AuthService>().user?.email ?? '',
              Icons.app_settings_alt_rounded,
              onTap: () { },
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
                  size: 24,
                ),
                Text(
                  label,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}