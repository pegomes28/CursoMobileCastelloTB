import '../models/emprestimo_model.dart';
import '../services/api_service.dart';

class EmprestimoController {

  //métodos

  //GET - All
  Future<List<EmprestimoModel>> fetchAll() async{
    final list = await ApiService.getList("emprestimos");//ordenando pelo nome A->Z
    //retorna a Lista de Usuários (Json) Convertida para Usuario Model(DART)
    return list.map<EmprestimoModel>((item)=>EmprestimoModel.fromJson(item)).toList(); 
  }

  //GET - One
  Future<EmprestimoModel> fetchOne(String id) async{
    final usuario = await ApiService.getOne("emprestimos", id);
    return EmprestimoModel.fromJson(usuario);
  }

  //POST
  Future<EmprestimoModel> create(EmprestimoModel u) async{
    final created = await ApiService.post("emprestimos", u.toJson());
    //adicionar o usuário e retorna o usuario adicionado
    return EmprestimoModel.fromJson(created);
  }

  //PUT
  Future<EmprestimoModel> update(EmprestimoModel u) async{
    final updated = await ApiService.put("emprestimos", u.toJson(), u.id!);
    //retorna o usuário atualizado
    return EmprestimoModel.fromJson(updated);
  }

  //DELETE
  Future<void> delete(String id) async{
    await ApiService.delete("emprestimos", id);
    //não tem retorno
  }
}