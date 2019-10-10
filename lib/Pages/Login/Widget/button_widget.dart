import 'package:flutter/material.dart';
class ButtonWidget extends StatelessWidget {

  final Function onTap;
  final bool anime;

  const ButtonWidget({Key key,this.onTap, this.anime}):super(key:key);

  _textButtom(){
    return Center(
      child: Text(
        'Fazer login',
        style: TextStyle(color: Colors.white,fontSize: 12),),
    );
  }


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child:Container(
      width: anime?50:200,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20)
      ),
      child: _textButtom(),
      ),
    );
  }
}
