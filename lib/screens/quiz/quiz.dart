import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import 'option.dart';

class QuizPage extends StatefulWidget {
  QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final TextEditingController _pinController = TextEditingController();
  String? _quizId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Consumer<QuizState>(
              builder: (context, appState, _) {
                if(_quizId == null) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: 100,
                          color: Colors.grey,
                          child: TextField(
                            textAlign: TextAlign.center,
                            autofocus: true,
                            decoration: InputDecoration(
                              fillColor: Colors.pink,
                              focusColor: Colors.pink,
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 5,
                            controller: _pinController,
                            style: TextStyle(
                              fontSize: 50
                            ),
                          ),
                      ),
                      ElevatedButton(onPressed: () { setState(() { _quizId = _pinController.text; }); }, child: Text("ENTRAR"))
                    ],
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        color: kPrimaryLightColor,
                        child: Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(top: 40.0, bottom: 24.0),
                              child: Text(
                                'TEXTO DA QUESTÃO QUE SERÁ APRESENTADADA',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                              ),
                            ),
                            TeXView(
                              child: TeXViewDocument(
                                  "Inicio da questão"
                                  r"""$$x = {-b \pm \sqrt{b^2-4ac} \over 2a}$$"""
                                  "Fim da questão",
                                  style: TeXViewStyle(textAlign: TeXViewTextAlign.center)),
                              renderingEngine: TeXViewRenderingEngine.katex(),
                            ),
                            Text(
                              'Após questão',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        color: Colors.lightBlueAccent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Option(questionLabel: 'Questão 1 com exemplo'),
                            Option(questionLabel: 'Questão 2 com exemplo'),
                            Option(questionLabel: 'Questão 3 com exemplo'),
                            Option(questionLabel: 'Questão 4 com exemplo'),
                          ],
                        ),
                      )
                    ],
                  );
                }
                return Center(child: const CircularProgressIndicator());
              }
          ),
    );
  }
}


enum CODE_VERIFICATION_STEP {
  INITIAL,
  SENDING,
  CHECKING,
  SHOW_SUCCESS,
  READY,
  DONE
}