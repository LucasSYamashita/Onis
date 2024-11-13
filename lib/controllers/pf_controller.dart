// controllers/bebidas_controller.dart
import '../models/item_cardapio.dart';

class PfController {
  List<ItemCardapio> getItems() {
    return [
      ItemCardapio(nome: 'Salada de Batata com Maionese', descricao: 'Batatas cozidas e maionese. Aproximadamente 450g', preco: 25.00),
      ItemCardapio(nome: 'Salada de Macarrão', descricao: 'Macarrão parafuzo, maionese, presunto e queijo. Aproximadamente 450g', preco: 25.00),
      ItemCardapio(nome: 'Rolinho de Alface com Peito de Peru', descricao: 'Alface, presunto, queijo, cenoura. 6 unidades', preco: 15.00),
      ItemCardapio(nome: 'Guacamole', descricao: 'Abacate, cebola, tomate e pimenta. Aproximadamente 300g', preco: 30.00),
      // Adicione mais itens conforme necessário
    ];
  }
}
