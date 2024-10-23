
//package:shared_preferences/shared_preferences.dart

import 'package:flutter/material.dart';
//import 'screens/login_screen.dart';
import 'package:onisapp/Sreens/login_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login e Cadastro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(), // Define tela inicial
      //home: LoginScreen(), // Define tela inicial
      //home: HomeScreen(),

    );
  }
}
