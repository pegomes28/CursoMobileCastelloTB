import 'package:exemplo_sqlite/models/nota_model.dart';
import 'package:exemplo_sqlite/services/nota_db_helper.dart';

class NotaController {
  static final NotaDbHelper _dbHelper = NotaDbHelper();

  // Controller
  // Insert
  Future<int> createNota(Nota nota) async {
    return _dbHelper.insertNota(nota);
  }

  // Get
  Future<List<Nota>> readNotas() async {
    return await _dbHelper.getNotas();
  }

  // Update
  Future<int> updateNota(Nota nota) async {
    return await _dbHelper.updateNota(nota);
  }

  // Delete
  Future<int> deleteNota(int id) async {
    return await _dbHelper.deleteNota(id);
  }
}
