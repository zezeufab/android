import 'package:flutter/material.dart';
class Usuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Tela de Usuário'),
        backgroundColor: Color.fromRGBO(55, 55,55, 0),
      ),
      body: new Container(
        child: new Row(
          children: <Widget>[
            new Image(image: AssetImage('imagens/login.png')),
          ],
        ),

    ),
    );
  }
}
