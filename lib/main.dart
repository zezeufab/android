import 'package:flutter/material.dart';
import 'package:efcontrole/Pages/Login.dart';
import 'package:efcontrole/Pages/Usuario.dart';
void main(){

  runApp(new MaterialApp(
    //home:Login(),
      home:new Usuario()
  ));
}


/*
void main(){
  runApp(new MaterialApp(
    home: MyApp(),
    theme: themeData,
  ));
}

  final ThemeData themeData=ThemeData(
    canvasColor: Colors.lightGreenAccent,
    accentColor: Colors.redAccent,
  );


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: FlatButton(
            onPressed: (){
              Navigator.push(context, PageTwo());
            },
            child: Text('Voltar para a primeira págína')
        ),
      ),
    );
  }
}

class PageTwo extends MaterialPageRoute<Null> {
    PageTwo():super(builder:(BuildContext context){
    return Scaffold(
      appBar: AppBar(
         backgroundColor : Theme.of(context).canvasColor,
        elevation: 1.0,
      ),//AppBar
      body: Center(
         child: RaisedButton(
           onPressed: (){
             Navigator.push(context, PageThree());
           },
           child: Text('Ir para a terceira pagína'),
         ),
      )//Center
    );//Scaffold
});
}

class PageThree extends MaterialPageRoute<Null>{
  PageThree():super(builder:(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Last Page!'),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 2.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
                onPressed: (){
                 Navigator.pop(context);
                },
          )
        ],
      ),
      body: Center(
        child: MaterialButton(
          onPressed: (){
            Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
          },
          child: Text('Go home!'),
        ),
      )
    );//Scaffold
  });
}
*/