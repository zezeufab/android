import 'dart:async';
import 'package:efcontrole/models/Usuario.dart';
import 'package:efcontrole/Utils/networkutil.dart';

class RestData {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "";
  static final LOGIN_URL = BASE_URL + "/";

  Future<Usuario> login(String username, String password,DateTime data, String imagem) {
    return new Future.value(new Usuario(username, password,data,imagem));
  }
}