import 'package:intl/intl.dart';

class Transacao {
  final int? id;
  final int categoriaId;
  final double valor;
  final DateTime dataHora;
  final String tipo;
  final String descricao;

  Transacao({
    this.id,
    required this.categoriaId,
    required this.valor,
    required this.dataHora,
    required this.descricao,
    required this.tipo,
  });

  // toMap : Obj => BD
  Map<String, dynamic> toMap() => {
    "id": id,
    "categoriaId": categoriaId,
    "valor": valor,
    "dataHora": dataHora.toIso8601String(),
    "descricao": descricao,
    "tipo": tipo,
  };

  // FromMap() : BD => Obj
  factory Transacao.fromMap(Map<String, dynamic> map) => Transacao(
    id: map["id"] as int,
    categoriaId: map["categoriaId"] as int,
    valor: map["valor"] as double,
    dataHora: DateTime.parse(map["dataHora"] as String),
    descricao: map["descricao"] as String, tipo: '',
  );

  // Método de conversão de Data e Hora para formato BR
  String get DataHoraLocal {
    final local = DateFormat("dd/MM/yyyy HH:mm");
    return local.format(dataHora);
  }
}
