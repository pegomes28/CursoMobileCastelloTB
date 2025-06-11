import 'package:sas_cfp/models/transacao_models.dart';
import 'package:sas_cfp/services/db_helper.dart';

class TransacaoController {
  final _dbHelper = DbHelper();

  createTransacao(Transacao transacao) async {
    return _dbHelper.insertTransacao(transacao);
  }

  readTransacaoByCategoria(int categoriaId) async {
    return _dbHelper.getTransacaoByCategoriaId(categoriaId);
  }

  deleteTransacao(int id) async {
    return _dbHelper.deleteTransacao(id);
  }
}
