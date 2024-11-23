// controllers/bebidas_controller.dart
import '../models/item_cardapio.dart';

class BebidasController {
  final List<ItemCardapio> _bebidas = [

    ItemCardapio(nome: 'Suco de Laranja', descricao: 'Natural e refrescante', preco: 5.00),
    ItemCardapio(nome: 'Refrigerante', descricao: 'Lata de 350ml', preco: 4.00),
    ItemCardapio(nome: 'Água Mineral', descricao: 'Sem gás', preco: 2.50),
    ItemCardapio(nome: 'Chá Gelado', descricao: 'Sabor limão', preco: 3.50),
      
  ];

  List<ItemCardapio> getItems() {
    return _bebidas;
  }

  void atualizarQuantidade(ItemCardapio bebida, int delta) {
    bebida.quantidade += delta;
    if (bebida.quantidade < 0) bebida.quantidade = 0;
  }
}


