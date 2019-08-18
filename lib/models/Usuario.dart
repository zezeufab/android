import 'dart:typed_data';

class Usuario{
  int _id;
  String _nome;
  String _senha;
  DateTime _data;
  Uint8List  _imagem;

  Usuario(String pNome, String pSenha,DateTime pData, String pImage);
  Usuario.map(dynamic obj){
    this._id=0;
    this._nome=obj['nome'];
    this._senha=obj['senha'];
    this._data=obj['data'];
    this._imagem=obj['imagem'];
  }

  int get id=>_id;
  String get nome=>_nome;
  String get senha=>_senha;
  DateTime get data=>_data;
  Uint8List  get imagem=>_imagem;

  Map<String, dynamic>toMap(){
    var map=new Map<String,dynamic>();
    map['id']=_id;
    map['nome']=_nome;
    map['senha']=_senha;
    map['data']=_data;
    map['imagem']=_imagem;
  }

}