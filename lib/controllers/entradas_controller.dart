// controllers/bebidas_controller.dart
import '../models/item_cardapio.dart';

class EntradaController {
  List<ItemCardapio> getItems() {
    return [
      ItemCardapio(nome: 'Crispy nachos', descricao: 'Tortilhas com queijo e carne moida. Aproximadamente 500g', preco: 20.00 ),
      ItemCardapio(nome: 'Fries', descricao: 'Batata frita. Aproximadamente 500g', preco: 20.00),
      ItemCardapio(nome: 'Vinagrete', descricao: 'Molho vinagrete. Aproximadamente 450g', preco: 15.00),
      ItemCardapio(nome: 'Pastel misto', descricao: 'Pastel frio misto de carne e queijo. 6 unidades', preco: 20.00),
      // Adicione mais itens conforme necessário
    ];
  }
}
