// views/screens/entradas_screen.dart
import 'package:flutter/material.dart';
import 'package:onisapp/views/widgets/background_container.dart';
import '../../controllers/entradas_controller.dart';
import '../../models/item_cardapio.dart';

class EntradasScreen extends StatelessWidget {
  final EntradaController _controller = EntradaController();

  @override
  Widget build(BuildContext context) {
    List<ItemCardapio> entradas = _controller.getItems();

    return Scaffold(
      appBar: AppBar(
        title: Text('Entradas'),
      ),
      body: BackgroundContainer(
        child: ListView.builder(
          itemCount: entradas.length,
          itemBuilder: (context, index) {
            final entrada = entradas[index];
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
                  title: Text(entrada.nome, style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(entrada.descricao),
                  trailing: Text('R\$ ${entrada.preco.toStringAsFixed(2)}'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


