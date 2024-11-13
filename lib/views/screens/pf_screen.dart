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
        title: const Text('Pratos Frios'),
      ),
      body: BackgroundContainer(
        child: ListView.builder(
          itemCount: pratosfrios.length,
          itemBuilder: (context, index) {
            final pratosfrio = pratosfrios[index];
            return Card(
              color: Colors.blue.withOpacity(0.8),
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListTile(
                  title: Text(
                    pratosfrio.nome,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(pratosfrio.descricao),
                  trailing: Text('R\$ ${pratosfrio.preco.toStringAsFixed(2)}'),
                  onTap: () => _mostrarDetalhesDoItem(context, pratosfrio),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _mostrarDetalhesDoItem(BuildContext context, ItemCardapio pratosfrio) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(pratosfrio.nome),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(pratosfrio.descricao),
              const SizedBox(height: 10),
              Text('Preço: R\$ ${pratosfrio.preco.toStringAsFixed(2)}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Fecha o diálogo
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}
