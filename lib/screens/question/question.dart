import 'package:flutter/material.dart';
import 'package:login_project/widgets/rounded_button.dart';
import 'package:login_project/screens/question/options.dart';

import '../../constants.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastre sua questão"),
        ),
        body: Column(
          children: [
            Card(
                color: kPrimaryLightColor,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    maxLines: 8, //or null
                    decoration: InputDecoration.collapsed(hintText: "Coloque o texto da sua questão aqui..."),
                  ),
                )
            ),
            RoundedButton(text: 'Próximo', onPress: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const OptionsPage();
              }));
            },),
          ],
        )
    );
  }
}
