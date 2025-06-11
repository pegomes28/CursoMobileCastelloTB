//  Classe de apoio a conexões do banco de dados
// classe Singleton -> objeto único

import 'package:path/path.dart';
import 'package:sas_cfp/models/transacao_models.dart';
import 'package:sas_cfp/models/categorias_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DbHelper {
  static Database? _database; // obj para criar as conexões com o BD
  // transformar a classe em Singleton
  // não permite instanciar outro objeto enquanto um obj estiver ativo
  static final DbHelper _instance = DbHelper._internal();
  // construtor singleton
  DbHelper._internal();
  factory DbHelper() => _instance;

  // Fazer as Conexões com o BD
  Future<Database> get database async {
    if (database != null) {
      return _database!;
    } else {
      _database = await _initDataBase();
      return _database!;
    }
  }

  Future<Database> _initDataBase() async {
    // Pegar o enderço do Banco de Dados
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "petshop.db"); //Caminho completo para o BD

    return await openDatabase(path, version: 1, onCreate: _onCreateDB);
  }

  Future<void> _onCreateDB(Database db, int version) async {
    // Criar a Tabela das Categorias
    await db.execute("""CREATE TABLE IF NOT EXISTS categorias(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    tipo TEXT NOT NULL,
    nome TEXT NOT NULL
    )""");
    print("tabela consultas criada");
    // Criar a tabela Transações
    await db.execute("""CREATE TABLE IF NOT EXISTS transacao(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    categoriaId INTEGER NOT NULL,
    valor TEXT NOT NULL,
    dataHora TEXT NOT NULL,
    descricao TEXT NOT NULL) 
    """);
    print("tabela transação criada");
  }

  // Método CRUD para Categorias
  Future<int> insertCategorias(Categorias categoria) async {
    final db = await database;
    return await db.insert("categorias", categoria.toMap());
  }

  Future<List<Categorias>> getCategorias() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      "categorias",
      // Receber as infos do BD
    );
    // Conventer os valores para obj
    return maps.map((e) => Categorias.fromMap(e)).toList();
  }

  Future<Categorias?> getCategoriasbyId(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      "categorias",
      where: "id=?",
      whereArgs: [id],
    );
    // Se encontrado
    if (maps.isNotEmpty) {
      return Categorias.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteCategorias(int id) async {
    final db = await database;
    return await db.delete("categorias", where: "id=?", whereArgs: [id]);
    // deleta a categoria
  }

  Future<int> insertTransacao(Transacao transacao) async {
    final db = await database;
    return await db.insert("transacao", transacao.toMap());
  }

  Future<List<Transacao>> getTransacaoByCategoriaId(int categoriaId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      "transacao",
      where: "categoriaId = ?",
      whereArgs: [categoriaId],
      orderBy: "dataHora ASC",
    );
    return maps.map((e) => Transacao.fromMap(e)).toList();
  }

  Future<int> deleteTransacao(int id) async {
    final db = await database;
    return await db.delete("transacao", where: "id=?", whereArgs: [id]);
  }
}
