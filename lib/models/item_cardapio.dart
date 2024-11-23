import 'package:uuid/uuid.dart';

class ItemCardapio {
  static final Uuid uuid = Uuid();  // Instancia o gerador de UUID
  final String id;
  final String nome;
  final double preco;
  final String descricao;
  int quantidade;

  ItemCardapio({
    required this.nome,
    required this.preco,
    required this.descricao,
    this.quantidade = 1,
  }) : id = uuid.v4();  // Gera um ID único para cada item
}
