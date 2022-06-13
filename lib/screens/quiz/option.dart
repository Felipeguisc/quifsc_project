import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Option extends StatefulWidget {
  final String questionLabel;

  Option({required this.questionLabel});

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      borderOnForeground: true,
      shape: const StadiumBorder(),
      child: InkWell(
        highlightColor: Colors.greenAccent.withOpacity(0.4),
        splashColor: Colors.green.withOpacity(0.5),
        customBorder: StadiumBorder(),
        onTap: () {
          setState(() {
            _selected = !_selected;
          });
        },
        child: Row(
          children: [
            !_selected
                ? const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                Icons.check_box_outline_blank,
                color: Colors.blueGrey,
              ),
            )
                : const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                Icons.check_box,
                color: Colors.blue,
              ),
            ),
            Flexible(child: Text(widget.questionLabel)),
          ],
        ),
      ),
    );
  }

  void onTap() {}
}


class QuizState extends ChangeNotifier {

  String? quizId;
  StreamSubscription<QuerySnapshot>? _questionSubscription;


}