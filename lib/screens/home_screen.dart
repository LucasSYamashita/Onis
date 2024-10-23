import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo!'),
      ),
      body: Center(
        child: Text('Você está logado!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
