import 'package:efcontrole/models/Usuario.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'package:efcontrole/data/StrinQuery.dart';

class DatabaseHelper{
  static final DatabaseHelper _instance =new DatabaseHelper.internal();
  factory DatabaseHelper()=>_instance;

  static Database _db;

  Future<Database> get db async{
    if(_db !=null){
      return _db;
    }
    _db=await initDb();
    return _db;
  }

  DatabaseHelper.internal();
  initDb() async{
    Directory documentDirectory =await getApplicationDocumentsDirectory();
    String path =join(documentDirectory.path,'efdata.db');
    var ourDb=await openDatabase(path,version: 1, onCreate: _onCreate);
    return ourDb;
  }
  void _onCreate(Database db, int versao) async{
    await db.execute(StringQuery.CreateTableUsuario);
    print('Tabela Usuario criada com sucesso!');
  }

  Future<int>saveUsuario(Usuario user) async{
    var dbClient=await db;
    int res=await dbClient.insert("Usuario", user.toMap());
    return res;
  }
  Future<int>deleteUsuario(Usuario user) async{
    var dbClient=await db;
    int res=await dbClient.delete("Usuario",where:"id=${user.id}",);
    return res;
  }
}