import 'package:flutter/material.dart';
import 'package:onisapp/views/widgets/background_container.dart';
import '../../controllers/pf_controller.dart';
import '../../models/item_cardapio.dart';
import '../../controllers/pedido_controller.dart';

class PfScreen extends StatefulWidget {
  @override
  _PfScreenState createState() => _PfScreenState();
}

class _PfScreenState extends State<PfScreen> {
  final PfController _controller = PfController();
  final PedidoController _pedidoController = PedidoController();

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
    int quantidade = 1;

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
                pratosfrio.quantidade = quantidade;
                _pedidoController.adicionarItem(pratosfrio);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${pratosfrio.nome} adicionado ao pedido')),
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
