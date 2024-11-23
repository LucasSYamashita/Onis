import '../models/item_cardapio.dart';

class PqController {
  final List<ItemCardapio> _pratosQuentes = [
    ItemCardapio(nome: 'Feijoada', descricao: 'Feijoada completa com arroz, farofa e couve', preco: 20.00),
    ItemCardapio(nome: 'Bife a Parmegiana', descricao: 'Bife empanado com molho de tomate e queijo', preco: 18.00),
    ItemCardapio(nome: 'Frango Assado', descricao: 'Frango assado com batatas', preco: 15.00),
    ItemCardapio(nome: 'Carne de Sol com Mandioca', descricao: 'Carne de sol acompanhada de mandioca frita', preco: 22.00),
  ];

  List<ItemCardapio> getItems() {
    return _pratosQuentes;
  }

  void atualizarQuantidade(ItemCardapio pratoQuente, int delta) {
    pratoQuente.quantidade += delta;
    if (pratoQuente.quantidade < 0) pratoQuente.quantidade = 0;
  }
}
