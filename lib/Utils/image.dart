import 'dart:convert';
import 'dart:io' as Io;
import 'package:flutter/material.dart' as material;
import 'package:flutter/cupertino.dart';
import 'package:image/image.dart' as Img;

class ImageEF {
  final _pathTemp = "";
    Future<Io.File>imageFile;

  Img.Image ImagePath(String pth, int width, int height) {
    Img.Image img;
    img = Img.readJpg(new Io.File(pth).readAsBytesSync());
    return Img.copyResize(img, height: height, width: width);
  }

  Img.Image Image(Img.Image image, int width, int height) {
    return Img.copyResize(image, height: height, width: width);
  }

  String ImageString(Img.Image image) {
    return ByteToString(image.getBytes());
  }

  List<int> StringToByte(String valor) {
    return utf8.encode(valor);
  }

  String ByteToString(List<int> byte) {
    return utf8.decode(byte);
  }

  Widget Imagem(String file_, int heigth, int width) {
    Img.Image image = ImageEF().ImagePath(file_, heigth, width);
    Img.Image thumbnail = Img.copyResize(image, width: 120);
    var file = Io.File('${file_}/temp.png')
      ..writeAsBytesSync(Img.encodePng(thumbnail));
    if (new Io.File('$file_/teste.png').exists() == null)
      return material.Image.file(file);
  }

  
}
