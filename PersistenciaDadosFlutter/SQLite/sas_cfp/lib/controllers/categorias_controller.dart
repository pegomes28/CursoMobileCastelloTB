import 'package:sas_cfp/models/categorias_model.dart';
import 'package:sas_cfp/services/db_helper.dart';

class CategoriasController {
  final DbHelper _dbHelper = DbHelper();

  // Métodos do Controller - Slim (magros)
  Future<int> createCategorias(Categorias categoria) async {
    return await _dbHelper.insertCategorias(categoria);
  }

  Future<List<Categorias>> readCategorias() async {
    return await _dbHelper.getCategorias();
  }

  Future<int> deleteCategorias(int id) async {
    return await _dbHelper.deleteCategorias(id);
  }
}
