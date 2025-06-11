import 'package:intl/intl.dart';

class Transacao {
  final int? id;
  final int categoriaId;
  final String valor;
  final DateTime dataHora;
  final String descricao;

  Transacao({
    this.id,
    required this.categoriaId,
    required this.valor,
    required this.dataHora,
    required this.descricao,
  });

  // toMap : Obj => BD
  Map<String, dynamic> toMap() => {
    "id": id,
    "categoriaId": categoriaId,
    "valor": valor,
    "dataHora": dataHora.toIso8601String(),
    "descricao": descricao,
  };

  // FromMap() : BD => Obj
  factory Transacao.fromMap(Map<String, dynamic> map) => Transacao(
    id: map["id"] as int,
    categoriaId: map["categoriaId"] as int,
    valor: map["valor"] as String,
    dataHora: DateTime.parse(map["dataHora"] as String),
    descricao: map["descricao"] as String,
  );

  // Método de conversão de Data e Hora para formato BR
  String get DataHoraLocal {
    final local = DateFormat("dd/MM/yyyy HH:mm");
    return local.format(dataHora);
  }
}
