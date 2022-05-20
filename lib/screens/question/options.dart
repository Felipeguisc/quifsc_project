import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:login_project/constants.dart';

class OptionsPage extends StatefulWidget {
  const OptionsPage({Key? key}) : super(key: key);

  @override
  State<OptionsPage> createState() => _OptionsPageState();
}

class _OptionsPageState extends State<OptionsPage> {
  final List<String> options = [];
  TextEditingController optionController = TextEditingController();

  void addItemToList(){
    String converted = optionController.text.replaceAll("\\calc", "r\"\"\"\$\$");
    String converted2 = converted.replaceAll("\\end", "\$\$\"\"\"");
    setState(() {
      options.insert(0,converted2);
    });
    optionController.text = '';
  }

  void removeItemFromList(){
    setState(() {
      options.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastre as alternativas')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: optionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Alternativa',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                ),
                child: Text('Adicionar'),
                onPressed: () {
                  addItemToList();
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                ),
                child: Text('Limpar'),
                onPressed: () {
                  removeItemFromList();
                },
              ),
            ],
          ),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 100,
                      margin: EdgeInsets.all(2),
                      color: kPrimaryLightColor,
                      child: Center(
                          child: TeXView(
                            child: TeXViewDocument(options[index]
                            //r"""$$x = {-b \pm \sqrt{b^2-4ac} \over 2a}$$"""
                            ,
                                style: TeXViewStyle(textAlign: TeXViewTextAlign.center)),
                          ),
                      ),
                    );
                  }
              )
          ),
        ],
      ),
    );
  }
}
