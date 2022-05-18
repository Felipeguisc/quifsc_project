import 'package:flutter/material.dart';
import 'package:login_project/screens/home/home.dart';
import 'package:login_project/screens/welcome/welcome.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if(auth.isLoading)
      return loading();
    else if (auth.user == null)
      return WelcomePage();
    else
      return HomePage();
  }

  loading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
