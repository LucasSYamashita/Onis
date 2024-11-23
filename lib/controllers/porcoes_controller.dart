import '../models/item_cardapio.dart';

class PorcoesController {
  final List<ItemCardapio> _porcoes = [
    ItemCardapio(nome: 'Porção de Fritas', descricao: 'Batatas fritas crocantes', preco: 10.00),
    ItemCardapio(nome: 'Porção de Frango a Passarinho', descricao: 'Frango frito com alho e limão', preco: 15.00),
    ItemCardapio(nome: 'Porção de Queijo Coalho', descricao: 'Queijo coalho grelhado', preco: 12.00),
    ItemCardapio(nome: 'Porção de Isca de Peixe', descricao: 'Iscas de peixe empanadas', preco: 18.00),
  ];

  List<ItemCardapio> getItems() {
    return _porcoes;
  }

  void atualizarQuantidade(ItemCardapio porcao, int delta) {
    porcao.quantidade += delta;
    if (porcao.quantidade < 0) porcao.quantidade = 0;
  }
}
