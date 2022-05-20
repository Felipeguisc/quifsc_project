import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Card(
          color: Colors.white,
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 16.0, bottom: 24.0),
                child: Text(
                  'TEXTO DA QUESTÃO QUE SERÁ APRESENTADADA',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                ),
              ),
              TeXView(
                child: TeXViewDocument(
                    "Inicio da questão"
                    r"""$$x = {-b \pm \sqrt{b^2-4ac} \over 2a}$$"""
                    "Fim da questão",
                    style: TeXViewStyle(textAlign: TeXViewTextAlign.center)),
              ),
              Text(
                'Após questão',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
