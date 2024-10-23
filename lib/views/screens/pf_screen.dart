import 'package:flutter/material.dart';
import 'package:onisapp/views/widgets/background_container.dart';
import '../../controllers/pf_controller.dart';
import '../../models/item_cardapio.dart';

class PfScreen extends StatelessWidget {
  final PfController _controller = PfController();

  @override
  Widget build(BuildContext context) {
    List<ItemCardapio> pratosfrios = _controller.getItems();

    return Scaffold(
      appBar: AppBar(
        title: Text('Pratos Frios'),
      ),
      body: BackgroundContainer(
        child: ListView.builder(
          itemCount: pratosfrios.length,
          itemBuilder: (context, index) {
            final pratosfrio = pratosfrios[index];
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
                  title: Text(pratosfrio.nome, style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(pratosfrio.descricao),
                  trailing: Text('R\$ ${pratosfrio.preco.toStringAsFixed(2)}'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
