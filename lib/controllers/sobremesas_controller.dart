import '../models/item_cardapio.dart';

class SobremesasController {
  final List<ItemCardapio> _sobremesas = [
    ItemCardapio(nome: 'Bolo Prestígio', descricao: 'Bolo de chocolate com recheio de cocada', preco: 10.00),
    ItemCardapio(nome: 'Pudim', descricao: 'Pudim de leite com caramelo', preco: 10.00),
    ItemCardapio(nome: 'Sorvete', descricao: 'Sorvete de creme com calda de morango', preco: 15.00),
    ItemCardapio(nome: 'Salada de Fruta', descricao: 'Frutas marinadas em suco de laranja', preco: 5.00),
  ];

  List<ItemCardapio> getItems() {
    return _sobremesas;
  }

  void atualizarQuantidade(ItemCardapio sobremesa, int delta) {
    sobremesa.quantidade += delta;
    if (sobremesa.quantidade < 0) sobremesa.quantidade = 0;
  }
}
