import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/question.dart';

class QuizState extends ChangeNotifier {

  String? quizId;
  StreamSubscription<QuerySnapshot>? _questionSubscription;
  bool loading = false;
  StreamSubscription<DocumentSnapshot>? _quizSubscription;

  ConnectState connectionState = ConnectState.disconnected;
  Awaiting awaiting = Awaiting.unknown;


  Future<void> pinQuiz(BuildContext context, String id) async {
    loading = true;
    print("Setou carregando");

    connectionState = ConnectState.connected;

    var docSnapshot = await FirebaseFirestore.instance
        .collection('online_quiz')
        .doc(id).get();

    if(docSnapshot.exists){
      print("Chegou aq " + docSnapshot.data()!['id']);

      _quizSubscription  = FirebaseFirestore.instance
          .collection('quiz')
          .doc(docSnapshot.data()!['id'])
          .snapshots()
          .listen((snapshot) {
        if (snapshot.data() != null) {
          if (snapshot.data()!['awaiting'] as bool) {
            awaiting = Awaiting.yes;
            print("Awaiting.yes");
          } else {
            awaiting = Awaiting.no;
            print("Awaiting.no");
          }
        } else {
          awaiting = Awaiting.unknown;
        }
        notifyListeners();
      });
    }
    else
    {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Não foi encontrado a sala informada'),
            content: Text("Verifique se o código de acesso foi digitado corretamente!"),
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
    loading = false;
  }

  Future<Question?> getQuestion() async {
    var docSnapshot = await FirebaseFirestore.instance
        .collection('question')
        .doc("90eQKiVQGym9M159bfWr").get();

    if(docSnapshot.exists){
      Question question = Question.fromJson(docSnapshot.data()!);
      print(question);
      return question;
    }
    return null;
  }

}

enum ConnectState { disconnected, connected, not_found, unknown }

enum Awaiting { yes, no, unknown }