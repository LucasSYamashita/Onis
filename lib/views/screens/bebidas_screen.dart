import 'package:flutter/material.dart';
import 'package:onisapp/views/widgets/background_container.dart';
import '../../controllers/bebidas_controller.dart';
import '../../models/item_cardapio.dart';

class BebidasScreen extends StatelessWidget {
  final BebidasController _controller = BebidasController();

  @override
  Widget build(BuildContext context) {
    List<ItemCardapio> bebidas = _controller.getItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bebidas'),
      ),
      body: BackgroundContainer(
        child: ListView.builder(
          itemCount: bebidas.length,
          itemBuilder: (context, index) {
            final bebida = bebidas[index];
            return Card(
              color: Colors.blue.withOpacity(0.8),
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListTile(
                  title: Text(
                    bebida.nome, 
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(bebida.descricao),
                  trailing: Text('R\$ ${bebida.preco.toStringAsFixed(2)}'),
                  onTap: () {
                    _mostrarDetalhesDaBebida(context, bebida); // Chama a função para mostrar detalhes ao clicar
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _mostrarDetalhesDaBebida(BuildContext context, ItemCardapio bebida) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(bebida.nome),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(bebida.descricao),
              const SizedBox(height: 10),
              Text('Preço: R\$ ${bebida.preco.toStringAsFixed(2)}'),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // Aqui você pode adicionar a lógica para remover o item da lista ou outras ações
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
