//"id":1,
//"usuarioId":1,
//"livroId":1,
//"dataEmprestismo":"2025-08-26",
//"dataDevolucao":"2025-09-05",
//"devolvido": false

class EmprestimoModel {
  // atributos
  final String? id;
  final String usuarioId;
  final String livroId;
  final String dataEmprestimo;
  final String dataDevolucao;
  final bool devolvido;

  EmprestimoModel({
    this.id, 
    required this.usuarioId, 
    required this.livroId, 
    required this.dataEmprestimo, 
    required this.dataDevolucao, 
    required this.devolvido});

  // Métodos
  // toJson
  Map<String, dynamic> toJson() => {
   "id":id,
   "usuarioId":usuarioId,
   "livroId":livroId,
   "dataEmprestimo":dataEmprestimo,
   "dataDevolucao":dataDevolucao,
   "devolvido":devolvido
  };

  // fromJson
  factory EmprestimoModel.fromJson(Map<String, dynamic> json) => EmprestimoModel(
    id: json["id"].toString(), 
    usuarioId: json["usuarioId"].toString(), 
    livroId: json["livroId"].toString(), 
    dataEmprestimo: json["dataEmprestimo"].toString(), 
    dataDevolucao: json["dataDevolucao"].toString(), 
    devolvido: json["disponivel"] == true ? true : false,
  
  );

}
