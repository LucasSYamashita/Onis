import 'package:flutter/material.dart';
import 'package:onisapp/views/widgets/background_container.dart';
import '../../controllers/entradas_controller.dart';
import '../../models/item_cardapio.dart';
import '../../controllers/pedido_controller.dart';

class EntradasScreen extends StatefulWidget {
  @override
  _EntradasScreenState createState() => _EntradasScreenState();
}

class _EntradasScreenState extends State<EntradasScreen> {
  final EntradaController _controller = EntradaController();
  final PedidoController _pedidoController = PedidoController();

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
    int quantidade = 1;

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
                entrada.quantidade = quantidade;
                _pedidoController.adicionarItem(entrada);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${entrada.nome} adicionado ao pedido')),
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
