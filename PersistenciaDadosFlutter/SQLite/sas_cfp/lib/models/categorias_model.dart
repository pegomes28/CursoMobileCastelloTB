class Categorias {
  // Atributos
  final int? id; // Pode ser nulo
  final String tipo;
  final String nome;

  // Métodos -> Construtor
  Categorias({this.id, required this.tipo, required this.nome});

  // Métodos de Conversão de OBJ <=> BD
  Map<String, dynamic> toMap() {
    return {"id": id, "tipo": tipo, "nome": nome};
  }

  // fromMap: BD => Obj
  factory Categorias.fromMap(Map<String, dynamic> map) {
    return Categorias(
      id: map["id"] as int, // Cast
      tipo: map["tipo"] as String,
      nome: map["nome"] as String
    );
  }

  get transacoes => null;
}
