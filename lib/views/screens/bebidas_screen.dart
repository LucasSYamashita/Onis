import 'package:flutter/material.dart';
import 'package:onisapp/views/widgets/background_container.dart';
import '../../controllers/bebidas_controller.dart';
import '../../controllers/pedido_controller.dart';
import '../../models/item_cardapio.dart';
import 'confirmacao_pedido_screen.dart';

class BebidasScreen extends StatelessWidget {
  final BebidasController _controller = BebidasController();
  final PedidoController _pedidoController = PedidoController();

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
              child: ListTile(
                title: Text(
                  bebida.nome,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(bebida.descricao),
                trailing: Text('R\$ ${bebida.preco.toStringAsFixed(2)}'),
                onTap: () {
                  _selecionarQuantidade(context, bebida);
                },
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConfirmacaoPedidoScreen(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.blue.withOpacity(0.8),
          ),
          child: const Text(
            'Confirmar Pedido',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

void _selecionarQuantidade(BuildContext context, ItemCardapio bebida) {
  int quantidade = 0;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text('Selecionar Quantidade - ${bebida.nome}'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(bebida.descricao),
                const SizedBox(height: 10),
                Text('Preço unitário: R\$ ${bebida.preco.toStringAsFixed(2)}'),
                const SizedBox(height: 10),
                Text(
                  'Total: R\$ ${(bebida.preco * quantidade).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove, color: Colors.red),
                      onPressed: () {
                        if (quantidade > 0) {
                          setState(() {
                            quantidade--;
                          });
                        }
                      },
                    ),
                    Text(
                      '$quantidade',
                      style: const TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.green),
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
                  Navigator.pop(context);
                },
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (quantidade > 0) {
                    bebida.quantidade = quantidade;
                    _pedidoController.adicionarItem(bebida);
                  }
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${bebida.nome} adicionado ao pedido')),
                  );
                },
                child: const Text('Adicionar'),
              ),
            ],
          );
        },
      );
    },
  );
}

}
