import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  bool isLoading = true;

  AuthService(){
    _authCheck();
  }

  _authCheck(){
    _auth.authStateChanges().listen((User? user){
      user = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  signInEmailAndPass(String email, String password) async {
    print('Iniciando login do usuário...');
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _getUser();
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'user-not-found') {
        throw AuthException('Olha, não encontramos nenhuma conta com esse e-mail cadastrado! \n\nCaso não tenha uma conta clique no botão Criar Conta');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Ops, parece que sua senha está incorreta!');
      } else {
        throw AuthException('Ops! Parece que ocorreu algum problema no seu login, tente novamente');
      }
    }
  }

  signUpWithEmailAndPassword(String email, String password) async {
    print('Iniciando criação de usuário...');
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      _getUser();
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'email-already-in-use') {
        throw AuthException('Este e-mail já está cadastrado');
      } else if (e.code == 'weak-password') {
        throw AuthException('A senha é muito fraca!');
      } else if (e.code == 'invalid-email') {
        throw AuthException('Parece que o e-mail informado não é valido!');
      } else {
        throw AuthException('Ops! Parece que ocorreu algum problema no cadastro, tente novamente');
      }
    }
  }

  signOut() async {
    try {
      await _auth.signOut();
      _getUser();
    } catch (e) {
      print(e.toString());
    }
  }

  _getUser(){
    user = _auth.currentUser;
    notifyListeners();
  }
}

class AuthException implements Exception {
  String message;

  AuthException(this.message);
}
