import 'package:sa_petshop/models/consulta_model.dart';
import 'package:sa_petshop/services/db_helper.dart';

class ConsultaController {
  // Atributos
  final _dbHelper = DbHelper();

  // Métodos

  // Create
  createConsulta(Consulta consulta) async {
    return _dbHelper.insertConsulta(consulta);
  }

  // ReadConsultaByPet
  readConsultaByPet(int petId) async {
    return _dbHelper.getConsultaByPetId(petId);
  }

  // DeleteConsulta
  deleteConsulta(int id) async {
    return _dbHelper.deleteConsulta(id);
  }
}
