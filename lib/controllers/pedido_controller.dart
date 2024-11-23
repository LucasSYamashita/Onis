import '../models/item_cardapio.dart';

class PedidoController {
  final List<ItemCardapio> _pedidoAtual = [];

  List<ItemCardapio> getPedidoAtual() {
    return _pedidoAtual;
  }

  // Função para adicionar um item ao pedido
  void adicionarItem(ItemCardapio item) {
    // Verifique se o item já existe no pedido e atualize a quantidade
    bool itemExistente = false;
    for (var pedidoItem in _pedidoAtual) {
      if (pedidoItem.id == item.id) {  // Compara o ID único do item
        pedidoItem.quantidade += item.quantidade;
        itemExistente = true;
        break;
      }
    }

    // Se o item não existir, adicione-o ao pedido
    if (!itemExistente) {
      _pedidoAtual.add(item);
    }
  }

  // Função para remover um item do pedido
  void removerItem(ItemCardapio item) {
    // Remove o item pelo ID único
    _pedidoAtual.removeWhere((pedidoItem) => pedidoItem.id == item.id);
  }

  // Função para calcular o total do pedido
  double calcularTotal() {
    return _pedidoAtual.fold(0.0, (total, item) => total + (item.preco * item.quantidade));
  }

  // Limpar o pedido
  void limparPedido() {
    _pedidoAtual.clear();
  }

  // Sincronizar o pedido com uma nova lista de itens
  void sincronizarPedido(List<ItemCardapio> itens) {
    _pedidoAtual.clear();
    for (var item in itens) {
      if (item.quantidade > 0) {
        _pedidoAtual.add(item);
      }
    }
  }
}
