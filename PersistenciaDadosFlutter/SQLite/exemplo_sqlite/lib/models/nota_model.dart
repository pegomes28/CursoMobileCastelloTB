class Nota {
  // Atributos = Colunas BD
  final int? id; //Pode ser nulo
  final String titulo;
  final String conteudo;

  // Construtor
  Nota({this.id, required this.titulo, required this.conteudo});

  //  Métodos

  //  Conversão para Objeto <=> BD

  //  toMap Objeto => BD
  Map<String, dynamic> toMap() {
    return {
      "id": id, // o id pode ser nulo ao criar
      "titulo": titulo,
      "conteudo": conteudo,
    };
  }

  // fromMap BD => Objeto
  factory Nota.fromMap(Map<String, dynamic> map) {
    return Nota(
      id: map["id"] as int, //converte para int(cast)
      titulo: map["titulo"] as String,
      conteudo: map["conteudo"] as String,
    );
  }
}
