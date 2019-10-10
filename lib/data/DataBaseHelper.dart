import 'dart:async';
import 'package:efcontrole/models/usuario.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBhelper {
  static Database _db;
  static const String ID = 'id';
  static const String TABLE = 'USUARIO';
  static const String DB_NAME = 'data.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }

    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE USUARIO (CODIGO INTEGER PRIMARY KEY, NOME TEXT, EMAIL TEXT, SENHA TEXT, IMAGE TEXT)");
  }

  Future<int> delteTable() async {
    var ret = await db;
    ret.execute("DELETE TABLE USUARIO");
  }

  Future<int> save(Usuario usu) async {
    var dbCliente = await db;
    // delteTable();
    return await dbCliente.insert(TABLE, usu.toMap());
  }

  Future<List<Usuario>> getListUsuario() async {
    var dbClient = await db;
    List<Map> maps = await dbClient
        .query(TABLE, columns: ["CODIGO", "NOME", "EMAIL", "SENHA", "IMAGE"]);
    List<Usuario> usuarios = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        usuarios.add(Usuario.fromMap(maps[i]));
      }
    }
    return usuarios;
  }

  Future<Usuario> getUsuario() async {
    var dbClient = await db;
    List<Map> maps = await dbClient
        .query(TABLE, columns: ["CODIGO", "NOME", "EMAIL", "SENHA", "IMAGE"]);
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        return await Usuario.fromMap(maps[i]);
      }
    }
    return null;
  }

  Future<int> delete(int codigo) async {
    var dbClient = await db;
    return await dbClient.delete(TABLE, where: 'CODIGO=?', whereArgs: [codigo]);
  }

  Future<int> update(Usuario usu) async {
    var dbClient = await db;
    return await dbClient
        .update(TABLE, usu.toMap(), where: 'CODIGO=?', whereArgs: [usu.codigo]);
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
