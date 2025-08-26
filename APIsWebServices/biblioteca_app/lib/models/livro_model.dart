//  "id": 1,
//  "titulo": "A Hora da Estrela",
//  "autor": "Clarice Lispector",
//  "disponível": false

class LivroModel {
  // atributos
  final String? id;
  final String titulo;
  final String autor;
  final bool disponivel;

  LivroModel({
    this.id,
    required this.titulo,
    required this.autor,
    required this.disponivel
  });

  // Métodos
  // toJson
  Map<String, dynamic> toJson() => {
    "id": id,
    "titulo": titulo,
    "autor": autor,
    "disponivel": disponivel
  };

  // fromJson
  factory LivroModel.fromJson(Map<String, dynamic> json) => LivroModel(
    titulo: json["titulo"].toString(),
    autor: json["autor"].toString(),
    disponivel: json["disponivel"] == true ? true : false, //operador ternário para corrigir a booleana
  );
}
