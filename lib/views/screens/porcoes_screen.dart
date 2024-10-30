import 'package:flutter/material.dart';
import 'package:onisapp/views/widgets/background_container.dart';

class PorcoesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cardápio'),
      ),
      body: const BackgroundContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Bem-vindo aos',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            // Outros elementos ou botões podem ser adicionados aqui
          ],
        ),
      ),
    );
  }
}
