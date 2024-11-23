import '../models/item_cardapio.dart';

class PfController {
  final List<ItemCardapio> _pratosFrios = [
    ItemCardapio(nome: 'Salada de Frango', descricao: 'Frango desfiado com maionese e legumes', preco: 12.00),
    ItemCardapio(nome: 'Tabule', descricao: 'Salada de trigo com tomate, pepino e hortelã', preco: 8.00),
    ItemCardapio(nome: 'Sushi', descricao: 'Sushi com peixe fresco', preco: 25.00),
    ItemCardapio(nome: 'Carpaccio', descricao: 'Carne bovina crua cortada finamente com molho de mostarda', preco: 18.00),
  ];

  List<ItemCardapio> getItems() {
    return _pratosFrios;
  }

  void atualizarQuantidade(ItemCardapio pratoFrios, int delta) {
    pratoFrios.quantidade += delta;
    if (pratoFrios.quantidade < 0) pratoFrios.quantidade = 0;
  }
}
