import 'package:flutter/material.dart';
import 'package:onisapp/views/widgets/background_container.dart';
import '../../controllers/pq_controller.dart';
import '../../models/item_cardapio.dart';
import '../../controllers/pedido_controller.dart';

class PqScreen extends StatefulWidget {
  @override
  _PqScreenState createState() => _PqScreenState();
}

class _PqScreenState extends State<PqScreen> {
  final PqController _controller = PqController();
  final PedidoController _pedidoController = PedidoController();

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
    int quantidade = 1;

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
                children: [
                  const Text('Quantidade: '),
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      if (quantidade > 1) {
                        setState(() {
                          quantidade--;
                        });
                      }
                    },
                  ),
                  Text('$quantidade'),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        quantidade++;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Adicionar o item ao pedido com a quantidade selecionada
                pratosquente.quantidade = quantidade;
                _pedidoController.adicionarItem(pratosquente);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${pratosquente.nome} adicionado ao pedido')),
                );
                Navigator.pop(context); // Fecha o dialog
              },
              child: const Text('Adicionar ao Pedido'),
            ),
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
