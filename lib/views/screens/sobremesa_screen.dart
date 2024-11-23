import 'package:flutter/material.dart';
import 'package:onisapp/views/widgets/background_container.dart';
import '../../controllers/sobremesas_controller.dart';
import '../../models/item_cardapio.dart';
import '../../controllers/pedido_controller.dart';

class SobremesaScreen extends StatefulWidget {
  @override
  _SobremesaScreenState createState() => _SobremesaScreenState();
}

class _SobremesaScreenState extends State<SobremesaScreen> {
  final SobremesasController _controller = SobremesasController();
  final PedidoController _pedidoController = PedidoController();

  @override
  Widget build(BuildContext context) {
    List<ItemCardapio> sobremesas = _controller.getItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobremesas'),
      ),
      body: BackgroundContainer(
        child: ListView.builder(
          itemCount: sobremesas.length,
          itemBuilder: (context, index) {
            final sobremesa = sobremesas[index];
            return Card(
              color: Colors.blue.withOpacity(0.8),
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListTile(
                  title: Text(sobremesa.nome, style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(sobremesa.descricao),
                  trailing: Text('R\$ ${sobremesa.preco.toStringAsFixed(2)}'),
                  onTap: () {
                    _mostrarDetalhesDoItem(context, sobremesa);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _mostrarDetalhesDoItem(BuildContext context, ItemCardapio sobremesa) {
    int quantidade = 1;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(sobremesa.nome),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(sobremesa.descricao),
              SizedBox(height: 10),
              Text('Preço: R\$ ${sobremesa.preco.toStringAsFixed(2)}'),
              SizedBox(height: 10),
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
                sobremesa.quantidade = quantidade;
                _pedidoController.adicionarItem(sobremesa);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${sobremesa.nome} adicionado ao pedido')),
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
