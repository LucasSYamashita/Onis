import 'package:flutter/material.dart';
import '../../controllers/pedido_controller.dart';
import '../../models/item_cardapio.dart';
import '../widgets/background_container.dart';

class ConfirmacaoPedidoScreen extends StatelessWidget {
  final PedidoController _pedidoController = PedidoController();

  ConfirmacaoPedidoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ItemCardapio> pedidoAtual = _pedidoController.getPedidoAtual();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmação de Pedido'),
      ),
      body: BackgroundContainer(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: pedidoAtual.isNotEmpty
                    ? ListView.builder(
                        itemCount: pedidoAtual.length,
                        itemBuilder: (context, index) {
                          final item = pedidoAtual[index];
                          return Card(
                            color: Colors.white.withOpacity(0.8),
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              title: Text(
                                '${item.quantidade}x ${item.nome}',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  'Preço unitário: R\$ ${item.preco.toStringAsFixed(2)}'),
                              trailing: Text(
                                'Total: R\$ ${(item.quantidade * item.preco).toStringAsFixed(2)}',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              onTap: () {
                                _mostrarDetalhesDoItem(context, item);
                              },
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: Text(
                          'Nenhum item no pedido.',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
              ),
              const SizedBox(height: 20),
              Text(
                'Total Geral: R\$ ${_pedidoController.calcularTotal().toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      _confirmarPedido(context);
                    },
                    child: const Text('Confirmar Pedido'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      _cancelarPedido(context);
                    },
                    child: const Text('Cancelar Pedido'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _mostrarDetalhesDoItem(BuildContext context, ItemCardapio item) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(item.nome),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Quantidade: ${item.quantidade}'),
              Text('Preço unitário: R\$ ${item.preco.toStringAsFixed(2)}'),
              Text('Total: R\$ ${(item.quantidade * item.preco).toStringAsFixed(2)}'),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  _pedidoController.removerItem(item);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${item.nome} removido do pedido')),
                  );
                },
                child: const Text('Remover Item'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  void _confirmarPedido(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pedido confirmado com sucesso!')),
    );
    Navigator.pop(context); // Retorna para a tela anterior
  }

   void _cancelarPedido(BuildContext context) {
     _pedidoController.limparPedido(); // Limpa os itens do pedido
     ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(content: Text('Pedido cancelado.')),
     );
     Navigator.pop(context); // Retorna para a tela anterior
   }

}