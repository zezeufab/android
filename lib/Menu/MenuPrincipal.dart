import 'package:flutter/material.dart';
import 'package:efcontrole/Pages/Usuario.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Página principal',style: TextStyle(color: Colors.white)),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(canvasColor: Color.fromRGBO(70, 70, 70, 1)),
        child: Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text('Elizeu Fabricio',style: TextStyle(color: Colors.white)),
              accountEmail: Text('elizeufabricio1@gmail.com',style: TextStyle(color: Colors.white),),
              currentAccountPicture: new GestureDetector(
                child: new CircleAvatar(backgroundImage: new AssetImage('images/Logo.png'),),
              ),              
              decoration: BoxDecoration(
                color: Colors.black54,
                image: new DecorationImage(image: new ExactAssetImage('images/fundo.png'),fit: BoxFit.fill),
              ),
            ),
            new ListTile(
              trailing: Image.asset('images/mlogin.png',width: 30,height: 30,),
              title: new Text('Alterar usuário',style: TextStyle(color: Colors.white),),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new Usuario()));
              }
            ),
            new ListTile(
              title: new Text('Cadastro de Categoria',style: TextStyle(color: Colors.white)),
               trailing:Image.asset('images/categoria.png',width: 30,height: 30,) //new Icon(Image.asset(name)),// Icons.account_balance_wallet,color: Colors.white,),
            ),
            new ListTile(
              title: new Text('Transferência',style: TextStyle(color: Colors.white)),
              trailing:Image.asset('images/transf.png',width: 30,height: 30,),
            ),
            new ListTile(
              title: new Text('Listar transferência',style: TextStyle(color: Colors.white)),
              trailing:Image.asset('images/listtransf.png',width: 30,height: 30,),
            ),
            new ListTile(
              title: new Text('Controle',style: TextStyle(color: Colors.white)),
              trailing:Image.asset('images/projeto.png',width: 30,height: 30,),
            ),
            new ListTile(
              title: new Text('Banco de dados',style: TextStyle(color: Colors.white)),
              trailing:Image.asset('images/dados.png',width: 30,height: 30,),
            ),
            new Divider(color: Colors.amber,indent: 10,endIndent: 10,),
            new ListTile(
              title: new Text('Ajuda',style: TextStyle(color: Colors.white)),
              trailing:Image.asset('images/ajuda.png',width: 30,height: 30,),
            ),
            new ListTile(
               title: new Text('Sobre',style: TextStyle(color: Colors.white)),
               trailing:Image.asset('images/ilogo.png',width: 30,height: 30,),
          ),
                ],
        ),
        ),
      ),

    );
  }

  Widget getImage() {
    AssetImage assetImage = AssetImage('images/logo.png');
    Image image = Image(image: assetImage, width: 160.0, height: 160.0,);
    return Container(child: image, margin: EdgeInsets.all(10),);
  }
}
