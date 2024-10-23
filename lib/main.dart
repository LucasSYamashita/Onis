import 'package:flutter/material.dart';
import 'package:onisapp/views/screens/home_screen.dart';
import 'views/screens/login_screen.dart';



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
      //home: LoginScreen(), // Define tela inicial
      home: HomeScreen(),
    );
  }
}
