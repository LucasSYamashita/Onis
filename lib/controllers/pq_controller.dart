// controllers/bebidas_controller.dart
import '../models/item_cardapio.dart';

class PqController {
  List<ItemCardapio> getItems() {
    return [
      ItemCardapio(nome: 'a', descricao: 'a', preco: 1),
      ItemCardapio(nome: 'a', descricao: 'a', preco: 1),
      ItemCardapio(nome: 'a', descricao: 'a', preco: 1),
      ItemCardapio(nome: 'a', descricao: 'a', preco: 1),
      // Adicione mais itens conforme necessário
    ];
  }
}
