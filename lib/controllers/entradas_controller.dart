// controllers/bebidas_controller.dart
import '../models/item_cardapio.dart';

class EntradaController {
  List<ItemCardapio> getItems() {
    return [
      ItemCardapio(nome: 'Suco de Laranja', descricao: 'Natural e refrescante', preco: 5.00),
      ItemCardapio(nome: 'Refrigerante', descricao: 'Lata de 350ml', preco: 4.00),
      ItemCardapio(nome: 'Água Mineral', descricao: 'Sem gás', preco: 2.50),
      ItemCardapio(nome: 'Chá Gelado', descricao: 'Sabor limão', preco: 3.50),
      // Adicione mais itens conforme necessário
    ];
  }
}
