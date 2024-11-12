// controllers/bebidas_controller.dart
import '../models/item_cardapio.dart';

class PorcoesController {
  List<ItemCardapio> getItems() {
    return [
      ItemCardapio(nome: 'isca de tilapia', descricao: 'a', preco: 1),
      ItemCardapio(nome: 'tiras de file', descricao: 'a', preco: 1),
      ItemCardapio(nome: 'a', descricao: 'a', preco: 1),
      ItemCardapio(nome: 'a', descricao: 'a', preco: 1),
      // Adicione mais itens conforme necessário
    ];
  }
}
