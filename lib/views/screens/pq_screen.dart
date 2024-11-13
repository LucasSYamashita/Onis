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
        title: const Text('Prato Principal'),
      ),
      body: BackgroundContainer(
        child: ListView.builder(
          itemCount: pratosquentes.length,
          itemBuilder: (context, index) {
            final pratosquente = pratosquentes[index];
            return Card(
              color: Colors.blue.withOpacity(0.8),
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListTile(
                  title: Text(
                    pratosquente.nome, 
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(pratosquente.descricao),
                  trailing: Text('R\$ ${pratosquente.preco.toStringAsFixed(2)}'),
                  onTap: () {
                    _mostrarDetalhesDoItem(context, pratosquente); // Chama a função ao clicar no card
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _mostrarDetalhesDoItem(BuildContext context, ItemCardapio pratosquente) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(pratosquente.nome),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(pratosquente.descricao),
              const SizedBox(height: 10),
              Text('Preço: R\$ ${pratosquente.preco.toStringAsFixed(2)}'),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // Aqui você pode adicionar a lógica para remover o item da lista, ou outras ações
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Item removido da lista')),
                      );
                      Navigator.pop(context); // Fecha o dialog
                    },
                    child: const Text('Remover Item'),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Fecha o dialog
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}
