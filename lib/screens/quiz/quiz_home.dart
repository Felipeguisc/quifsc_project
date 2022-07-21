import 'package:flutter/material.dart';
import 'package:login_project/screens/quiz/quiz.dart';
import 'package:login_project/screens/quiz/quiz_state.dart';
import 'package:provider/provider.dart';

class QuizHomePage extends StatelessWidget {
  const QuizHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastre as alternativas')),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: _FeatureItem(
              'Gerar Quiz',
              Icons.cached_rounded,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ChangeNotifierProvider(
                    create: (context) => QuizState(),
                    builder: (context, _) => QuizPage(),
                  );
                }));
              },
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: _FeatureItem(
              'Criar Quiz',
              Icons.edit_note_rounded,
              onTap: () {},
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: _FeatureItem(
              'Selecionar do Repositório',
              Icons.collections_bookmark_rounded,
              onTap: () {},
            ),
          ),
        ],
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
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                        fontSize: 50,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
