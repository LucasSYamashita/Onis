// views/screens/sobremesa_screen.dart
import 'package:flutter/material.dart';
import 'package:onisapp/views/widgets/background_container.dart';
import '../../controllers/sobremesas_controller.dart';
import '../../models/item_cardapio.dart';

class SobremesaScreen extends StatelessWidget {
  final SobremesasController _controller = SobremesasController();

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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // Aqui você pode adicionar a lógica para remover o item da lista, ou outras ações
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Item removido da lista de sobremesas')),
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
