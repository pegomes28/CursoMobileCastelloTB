import 'package:biblioteca_app/models/livro_model.dart';
import 'package:biblioteca_app/services/api_service.dart';

class UsuarioController {
  // métodos

  // Get
  Future<List<LivroModel>> fetchAll() async {
    final list = await ApiService.getList("livros");
    // retorna a lista de usuários convertida para usuario model (dart)
    return list
        .map<LivroModel>((item) => LivroModel.fromJson(item))
        .toList();
  }

  // Get - One
  Future<LivroModel> fetchOne(String id) async {
    final usuario = await ApiService.getOne("livros", id);
    return LivroModel.fromJson(usuario);
  }

  // Post
  Future<LivroModel> create(LivroModel u) async {
    final created = await ApiService.post("livros", u.toJson());
    // adicionar o usuário e retorna o usuário adicionado
    return LivroModel.fromJson(created);
  }

  // Put
  Future<LivroModel> update(LivroModel u) async {
    final updated = await ApiService.put("livros", u.toJson(), u.id!);
    return LivroModel.fromJson(updated);
  }

  // Delete
  Future<void> delete(String id) async {
    await ApiService.delete("livros", id);
    // não ter retorno
  }
}
