import 'package:biblioteca_app/models/usuario_model.dart';
import 'package:biblioteca_app/services/api_service.dart';

class UsuarioController {
  // métodos

  // Get
  Future<List<UsuarioModel>> fetchAll() async {
    final list = await ApiService.getList("usuarios");
    // retorna a lista de usuários convertida para usuario model (dart)
    return list
        .map<UsuarioModel>((item) => UsuarioModel.fromJson(item))
        .toList();
  }

  // Get - One
  Future<UsuarioModel> fetchOne(String id) async {
    final usuario = await ApiService.getOne("usuarios", id);
    return UsuarioModel.fromJson(usuario);
  }

  // Post
  Future<UsuarioModel> create(UsuarioModel u) async {
    final created = await ApiService.post("usuarios", u.toJson());
    // adicionar o usuário e retorna o usuário adicionado
    return UsuarioModel.fromJson(created);
  }

  // Put
  Future<UsuarioModel> update(UsuarioModel u) async {
    final updated = await ApiService.put("usuarios", u.toJson(), u.id!);
    return UsuarioModel.fromJson(updated);
  }

  // Delete
  Future<void> delete(String id) async {
    await ApiService.delete("usuarios", id);
    // não ter retorno
  }
}
