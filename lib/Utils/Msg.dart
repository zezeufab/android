import 'package:flutter/material.dart';
// ignore: camel_case_types
class  Msg {
static TextEditingController customController= TextEditingController();
  static void Show(BuildContext context,String value) {
    if (value.isEmpty) return;

    AlertDialog dialog = new AlertDialog(
      backgroundColor: Colors.amber,
      content: new Text(value,
        style: new TextStyle(
            fontSize: 30.0),
      ),
      actions: <Widget>[
        new FlatButton(onPressed: () {Navigator.of(context).pop(customController.text.toString());}, child: new Text("Ok")),

      ],
    );
    showDialog(context: context, child: dialog);
  }
static Show1(BuildContext context,titulo,mensagem){
  //TextEditingController customController= TextEditingController();
  return showDialog(
   context: context,
    barrierDismissible: true,
    builder: (BuildContext context){
     return AlertDialog(
       title: Text(titulo,style: TextStyle(color: Colors.white),),
       backgroundColor: Colors.black,
       content: SingleChildScrollView(
         child: ListBody(
           children: <Widget>[
             Text(mensagem,style: TextStyle(color: Colors.white),)
           ],
         ),
       ),
       actions: <Widget>[
         FlatButton(
           onPressed: ()=>Navigator.pop(context),
           child: Text('OK',style:TextStyle(color: Colors.white,fontSize: 16),),
         )
       ],
     );
    }
  );

}
static _confirmaResult(bool result,BuildContext context){
    if(result)
      print('Sim');
    else
      print('Não');
    Navigator.pop(context);

}

static Confirma(BuildContext context,titulo,mensagem){
  //TextEditingController customController= TextEditingController();
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(titulo,style: TextStyle(color: Colors.white,fontSize: 26),),
          backgroundColor: Color.fromRGBO(34, 34, 34, 1),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(mensagem,style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: ()=>_confirmaResult(true,context),
              child: Text('Confimar',style:TextStyle(color: Colors.white,fontSize: 16),),
            ),
            FlatButton(
              onPressed: ()=>_confirmaResult(false,context),
              child: Text('Cancelar',style:TextStyle(color: Colors.white,fontSize: 16),),
            )
          ],
        );
      }
  );

}

}

enum MyDialogAction{
OK
}
