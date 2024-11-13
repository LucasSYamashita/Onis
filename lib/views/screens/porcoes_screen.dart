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
        title: const Text('Porções'),
      ),
      body: BackgroundContainer(
        child: ListView.builder(
          itemCount: porcoes.length,
          itemBuilder: (context, index) {
            final porcoe = porcoes[index];
            return Card(
              color: Colors.blue.withOpacity(0.8),
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListTile(
                  title: Text(
                    porcoe.nome, 
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(porcoe.descricao),
                  trailing: Text('R\$ ${porcoe.preco.toStringAsFixed(2)}'),
                  onTap: () {
                    _mostrarDetalhesDaPorcao(context, porcoe); // Chama a função para mostrar detalhes ao clicar
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _mostrarDetalhesDaPorcao(BuildContext context, ItemCardapio porcoe) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(porcoe.nome),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(porcoe.descricao),
              const SizedBox(height: 10),
              Text('Preço: R\$ ${porcoe.preco.toStringAsFixed(2)}'),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // Lógica para remover o item ou outras ações
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
