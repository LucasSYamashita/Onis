import 'package:flutter/material.dart';
import 'package:onisapp/views/widgets/background_container.dart';
import '../../controllers/pq_controller.dart';
import '../../models/item_cardapio.dart';

class PqScreen extends StatelessWidget {
  final PqController _controller = PqController();

  @override
  Widget build(BuildContext context) {
    List<ItemCardapio> pratosquentes = _controller.getItems();

    return Scaffold(
      appBar: AppBar(
        title: Text('Prato Principal'),
      ),
      body: BackgroundContainer(
        child: ListView.builder(
          itemCount: pratosquentes.length,
          itemBuilder: (context, index) {
            final pratosquente = pratosquentes[index];
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
                  title: Text(pratosquente.nome, style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(pratosquente.descricao),
                  trailing: Text('R\$ ${pratosquente.preco.toStringAsFixed(2)}'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
