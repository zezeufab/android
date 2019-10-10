import 'package:efcontrole/Pages/Login/biometria.dart';
import 'package:flutter/material.dart';
import 'Pages/Login/Login.dart';
import 'Utils/diretorio.dart';
import 'Utils/global.dart';

void main() => runApp(Inicio());

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _criaDir() async {
      VarGlobal.dirTemp = await Diretorio.getDirectoryTemp();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      title: 'Controle financeiro pessoal',
      home: VarGlobal.Biometria ? LoginBeometria() : Login(),
    );
  }
}
