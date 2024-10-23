// views/screens/entradas_screen.dart
import 'package:flutter/material.dart';
import 'package:onisapp/views/widgets/background_container.dart';
import '../../controllers/porcoes_controller.dart';
import '../../models/item_cardapio.dart';

class PorcoesScreen extends StatelessWidget {
  final PorcoesController _controller = PorcoesController();

  @override
  Widget build(BuildContext context) {
    List<ItemCardapio> porcoes = _controller.getItems();

    return Scaffold(
      appBar: AppBar(
        title: Text('Poções'),
      ),
      body: BackgroundContainer(
        child: ListView.builder(
          itemCount: porcoes.length,
          itemBuilder: (context, index) {
            final porcoe = porcoes[index];
            return Card(
              color: Colors.white.withOpacity(0.8),
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.withOpacity(0.9),
                  padding: EdgeInsets.all(16),
                ),
                onPressed: () {
                  // Lógica ao pressionar o botão
                },
                child: ListTile(
                  title: Text(porcoe.nome, style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(porcoe.descricao),
                  trailing: Text('R\$ ${porcoe.preco.toStringAsFixed(2)}'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

