import '../models/item_cardapio.dart';

class SobremesasController {
  List<ItemCardapio> getItems() {
    return [
      ItemCardapio(nome: 'bolo prestigio', descricao: 'Bolo de chocolate com recheio de cocada', preco: 10.00),
      ItemCardapio(nome: 'pudin', descricao: 'pudin de leite com caramelo', preco: 10.00),
      ItemCardapio(nome: 'sorvete', descricao: 'sorvete de creme com calda de morango', preco: 15.00),
      ItemCardapio(nome: 'salada de fruta', descricao: 'frutas marinadas em suco de laranja', preco: 5.00),
      // Adicione mais itens conforme necessário
    ];
  }
}
