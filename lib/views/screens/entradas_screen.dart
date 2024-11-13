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
        title: const Text('Entradas'),
      ),
      body: BackgroundContainer(
        child: ListView.builder(
          itemCount: entradas.length,
          itemBuilder: (context, index) {
            final entrada = entradas[index];
            return Card(
              color: Colors.blue.withOpacity(0.8),
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListTile(
                  title: Text(
                    entrada.nome,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(entrada.descricao),
                  trailing: Text('R\$ ${entrada.preco.toStringAsFixed(2)}'),
                  onTap: () => _mostrarDetalhesDoItem(context, entrada),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _mostrarDetalhesDoItem(BuildContext context, ItemCardapio entrada) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(entrada.nome),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(entrada.descricao),
              const SizedBox(height: 10),
              Text('Preço: R\$ ${entrada.preco.toStringAsFixed(2)}'),
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
