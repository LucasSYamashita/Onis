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
        title: Text('Bebidas'),
      ),
      body: BackgroundContainer(
        child: ListView.builder(
          itemCount: bebidas.length,
          itemBuilder: (context, index) {
            final bebida = bebidas[index];
            return Card(
              color: Colors.blue.withOpacity(0.8),
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
               child:Padding(
                  padding: const EdgeInsets.all(16),
                  

                child: ListTile(
                title: Text(bebida.nome, style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(bebida.descricao),
                trailing: Text('R\$ ${bebida.preco.toStringAsFixed(2)}'),
                ),
               ),
            );
          },
        ),
      ),
    );
  }
}