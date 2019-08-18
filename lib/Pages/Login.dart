import 'package:flutter/material.dart';
import 'package:efcontrole/Pages/Principal.dart';

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.amber,
          fontFamily: "Ubuntu"
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _miniPadding = 5.0;
  bool _isSelected = false;
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }


  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EFControle - Finança pessoal',style: TextStyle(color:Colors.amber,),),
        backgroundColor: Color.fromRGBO(20, 20, 20, 1),

      ),
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(color: Colors.black87),
        padding: EdgeInsets.only(
            top: 10.0, right: 20.0, left: 20.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            getImage(),
            SizedBox(height: 40.0,),
            Text(
              "LOGIN",
              style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Theme
                      .of(context)
                      .primaryColor
              ),
            ),

            SizedBox(height: 20.0,),
            buildTextField("Digite sua senha"),
            SizedBox(height: 20.0,),
            Container(
              child: Row(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: _radio,
                    child: radioButton(_isSelected),
                  ),
                  SizedBox(width: 8.0,),
                  Text('Lembrar senha',style: TextStyle(color:Colors.white),textAlign: TextAlign.left,)
                ],
              ),
            ),
            SizedBox(height: 20.0),
            buildButtonContainer(),
            SizedBox(height: 19.0,),
          ],
        ),

      ),
    );
  }


  Widget buildTextField(String hintText) {
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0)
        ),
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          onPressed:_toggleVisibility,
          icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
        ),
      ),
      obscureText: _isHidden,
      style: TextStyle(color: Colors.white,fontSize: 24),
      textAlign: TextAlign.center,
    );
  }

  Widget radioButton(bool isSelected) {
    return Container(
      width: 22.0,
      height: 22.0,
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2.0, color: Colors.white)
      ),
      child: isSelected ?
      Container(
            width: double.infinity, height: double.infinity, decoration:
           BoxDecoration(shape: BoxShape.circle, color: Colors.amber),)
      : Container(),
    );
  }


    Widget buildButtonContainer() {
      return Container(
        height: 50.0,
        width: MediaQuery
            .of(context)
            .size
            .width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23.0),
          gradient: LinearGradient(
              colors: [
                Colors.amber[200],
                Colors.amber
              ],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft
          ),
        ),
        child: MaterialButton(
          //onPressed:(){Msg.Show(context, "Botão pressionado...");},
          onPressed: (){iniPrincipal();},
          child: Text(
            "LOGAR",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      );
    }

    void iniPrincipal(){
     Navigator.push(context, new MaterialPageRoute(builder: (context)=>new Principal()));
    }

    Widget getImage() {
      AssetImage assetImage = AssetImage('images/login.png');
      Image image = Image(image: assetImage, width: 160.0, height: 160.0,);
      return Container(child: image, margin: EdgeInsets.all(_miniPadding + 10),);
    }
  }
