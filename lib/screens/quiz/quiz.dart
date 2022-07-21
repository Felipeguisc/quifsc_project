import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:login_project/screens/quiz/quiz_state.dart';
import 'package:login_project/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../widgets/pin_input.dart';
import 'option.dart';

class QuizPage extends StatefulWidget {
  QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final TextEditingController _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<QuizState>(builder: (context, appState, _) {
        switch (appState.connectionState) {
          case ConnectState.connected:
            switch (appState.awaiting) {
              case Awaiting.yes:
                return Container(
                  color: Colors.deepPurple,
                  child: Center(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Aguardando...',
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                      repeatForever: true,
                      pause: const Duration(milliseconds: 1000),
                      displayFullTextOnTap: true,
                      stopPauseOnTap: false,
                    ),
                  ),
                );
              case Awaiting.no:
                return QuizWidget();
            }
            return Center(child: const CircularProgressIndicator());
          case ConnectState.disconnected:
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Coloque o pin da sala de Quiz que você deseja acessar :)",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: !appState.loading
                        ? PinInput(controller: _pinController)
                        : CircularProgressIndicator(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RoundedButton(
                    text: "ENTRAR",
                    onPress: () =>
                        appState.pinQuiz(context, _pinController.text),
                  ),
                ],
              ),
            );
        }
        return Center(child: const CircularProgressIndicator());
      }),
    );
  }
}

class QuizWidget extends StatefulWidget {
  const QuizWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: Column(
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
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Option(questionLabel: 'Questão 1 com exemplo'),
              Option(questionLabel: 'Questão 2 com exemplo'),
              Option(questionLabel: 'Questão 3 com exemplo'),
              Option(questionLabel: 'Questão 4 com exemplo'),
            ],
          )
        ],
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
