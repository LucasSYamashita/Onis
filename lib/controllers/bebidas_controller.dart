import '../models/item_cardapio.dart';

class BebidasController {
  // Lista de bebidas disponíveis
  List<ItemCardapio> getItems() {
    return [
      ItemCardapio(nome: 'Suco de Laranja', descricao: 'Natural e refrescante', preco: 5.00),
      ItemCardapio(nome: 'Refrigerante', descricao: 'Lata de 350ml', preco: 4.00),
      ItemCardapio(nome: 'Água Mineral', descricao: 'Sem gás', preco: 2.50),
      ItemCardapio(nome: 'Chá Gelado', descricao: 'Sabor limão', preco: 3.50),
      // Adicione mais itens conforme necessário
    ];
  }

  // Método para adicionar bebida ao pedido (exemplo de interação com o PedidoController)
  void adicionarBebidaAoPedido(ItemCardapio bebida) {
    // Lógica para adicionar a bebida ao pedido (necessário criar essa interação com PedidoController)
    // _pedidoController.adicionarItem(bebida);
  }

  // Método para remover bebida do pedido
  void removerBebidaDoPedido(ItemCardapio bebida) {
    // Lógica para remover a bebida do pedido (novamente interagir com PedidoController)
    // _pedidoController.removerItem(bebida);
  }
}
