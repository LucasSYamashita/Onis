// views/screens/confirmacao_pedido_screen.dart
import 'package:flutter/material.dart';
import 'package:onisapp/views/widgets/background_container.dart';
import '../../models/item_cardapio.dart';
import '../../controllers/pedido_controller.dart';

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
                child: ListView.builder(
                  itemCount: pedidoAtual.length,
                  itemBuilder: (context, index) {
                    final item = pedidoAtual[index];
                    return Card(
                      color: Colors.white.withOpacity(0.8),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(item.nome, style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(item.descricao),
                        trailing: Text('R\$ ${item.preco.toStringAsFixed(2)}'),
                        onTap: () {
                          _mostrarDetalhesDoItem(context, item);
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Total: R\$ ${_pedidoController.calcularTotal().toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
              Text(item.descricao),
              SizedBox(height: 10),
              Text('Preço: R\$ ${item.preco.toStringAsFixed(2)}'),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      _pedidoController.removerItem(item);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Item removido do pedido')),
                      );
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
    // Aqui você pode adicionar lógica para salvar o pedido ou enviá-lo para o backend
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
