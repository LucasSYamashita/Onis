// controllers/pedido_controller.dart
import '../models/item_cardapio.dart';

class PedidoController {
  final List<ItemCardapio> _pedidoAtual = [];

  List<ItemCardapio> getPedidoAtual() {
    return _pedidoAtual;
  }

  void adicionarItem(ItemCardapio item) {
    _pedidoAtual.add(item);
  }

  void removerItem(ItemCardapio item) {
    _pedidoAtual.remove(item);
  }

  double calcularTotal() {
    return _pedidoAtual.fold(0, (total, item) => total + item.preco);
  }

  void limparPedido() {
    _pedidoAtual.clear();
  }
}
