import 'package:flutter/material.dart';
import 'package:efcontrole/Menu/Menu.dart';
class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página principal',style: TextStyle(color: Colors.white)),
        iconTheme: new IconThemeData(color: Colors.white),
        backgroundColor: Color.fromRGBO(25, 25, 25, 1),
      ),
      drawer: new Drawer(

        child: Menu(),
      ),
      body: new Container(

      ),
    );
  }


}
