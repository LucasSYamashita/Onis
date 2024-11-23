// controllers/entradas_controller.dart
import '../models/item_cardapio.dart';

class EntradaController {
  final List<ItemCardapio> _entradas = [
    ItemCardapio(nome: 'Crispy nachos', descricao: 'Tortilhas com queijo e carne moída. Aproximadamente 500g', preco: 20.00),
    ItemCardapio(nome: 'Fries', descricao: 'Batata frita. Aproximadamente 500g', preco: 20.00),
    ItemCardapio(nome: 'Vinagrete', descricao: 'Molho vinagrete. Aproximadamente 450g', preco: 15.00),
    ItemCardapio(nome: 'Pastel misto', descricao: 'Pastel frio misto de carne e queijo. 6 unidades', preco: 20.00),
    // Adicione mais itens conforme necessário
  ];

  List<ItemCardapio> getItems() {
    return _entradas;
  }

  void atualizarQuantidade(ItemCardapio entrada, int delta) {
    entrada.quantidade += delta;
    if (entrada.quantidade < 0) entrada.quantidade = 0;
  }
}
