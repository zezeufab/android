import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:efcontrole/Utils/Msg.dart';
import 'package:efcontrole/Utils/diretorio.dart';
import 'package:efcontrole/Utils/global.dart';
import 'package:efcontrole/Utils/image.dart';
import 'package:efcontrole/data/DataBaseHelper.dart';
import 'package:efcontrole/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as io;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Widget_CadUsuario extends StatefulWidget {
  @override
  _CadUsuarioState createState() => _CadUsuarioState();
}

class _CadUsuarioState extends State<Widget_CadUsuario> {
  var path_ = '';
  var dir_ = '';
  final _passKey = GlobalKey<FormFieldState>();
  get value => null;
  String _nome = '';
  String _senha = '';
  String _senhaR = '';
  String _email = '';
  String _image = '';
  Usuario _usu;
  int _codusu;
  bool _visivel = false;
  bool _update = false;
  Future<File> imageFile;
  Future<Usuario> _usuario;
  DBhelper _dbHelper;
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _senhaRController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  refreshUsuario() {
    setState(() {
      _usuario = _dbHelper.getUsuario();
    });
  }

  _criaDir() async {
    await Diretorio.getDirectoryTemp1(VarGlobal.dirTemp);
  }

  _deletaDir() async {
    await Diretorio.DeleteDir(VarGlobal.dirTemp);
  }

  @override
  void initState() {
    super.initState();
    _deletaDir();
    _criaDir();
    _dbHelper = DBhelper();
    refreshUsuario();
    _carregar();
  }

  _clear() {
    _nomeController.text = '';
    _senhaController.text = '';
    _emailController.text = '';
    _senhaRController.text = '';
  }

  validar() {
    // if (_passKey.currentState.validate()) {
    // _passKey.currentState.save();
    if (_senhaRController.text != _senhaController.text) {
      Msg.Show(context, "As senhas não correspondem!");
      return "As senhas não são iguais";
    }
    if (_update) {
      Usuario u = Usuario(1, _nome, _email, _senha, _image);
      _dbHelper.update(u);
      setState(() {
        _update = false;
      });
    } else {
      Usuario u = Usuario(1, _nome, _email, _senha, _image);
      _dbHelper.save(u);
    }
    // }
    _clear();
    refreshUsuario();
  }

  _carregar() {
    setState(() {
      FutureBuilder(
        future: _usuario,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _usu = snapshot.data;
            carregaUsu();
            return Text('Item carregado');
          } else
            return Text('Item não carregado');
        },
      );
    });
  }

  carregaUsu() {
    if (_usu != null) {
      _codusu = _usu.codigo;
      _nomeController.text = _usu.nome;
      _emailController.text = _usu.email;
      _senhaController.text = _usu.senha;
      _senhaRController.text = _usu.senha;
      _image = _usu.image;
      _update = true;
      // try {
      // if (_image != null) {
      //   File _file;
      //  var _fileTemp = new DateFormat("hhmmss").format(DateTime.now());
      // _file = File('${VarGlobal.dirTemp}/${_fileTemp}.png')
      //   ..writeAsBytesSync(_dataFromBase64String(_image));
      // } else {
      //return Image.asset('images/semimagem.png');
      // }
      //} catch (e) {
      //  var ee = e.toString();
      // }
    }
  }

  ShowImage() {
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot != null) {
          if (snapshot.data == null) {
            return Image.asset('images/semimagem.png');
          }
          File _file;
          io.Image image = ImageEF().ImagePath(snapshot.data.path, 150, 150);
          io.Image thumbnail = io.copyResize(image, height: 150, width: 150);

          if (VarGlobal.dirTemp != null) {
            try {
              var _fileTemp = new DateFormat("hhmmss").format(DateTime.now());
              _file = File('${VarGlobal.dirTemp}/${_fileTemp}.png')
                ..writeAsBytesSync(io.encodePng(thumbnail));
              _image = _base64String(io.encodePng(thumbnail));
            } catch (e) {
              var ee = e.toString();
            }
            print('Diretorio exite ja');
            return Image.file(_file);
          } else {
            print('Diretorio não existe ainda');
          }
        } else if (snapshot.error != null) {
          return const Text('Erro ao carregar imagem',
              textAlign: TextAlign.center);
        } else {
          print('Diretorio não existe ainda...');
          return Image.asset('images/semimagem.png');
        }

        return Image.asset('images/semimagem.png');
      },
    );
  }

  pickerImageGallery(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

  Uint8List _dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  String _base64String(Uint8List data) {
    return base64Encode(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _passKey,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(
          'Cadastro de usúario',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        // key: _passKey,
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _carregaImagem(),
              _textFormFieldNome(),
              SizedBox(
                height: 10,
              ),
              _textFormFieldEmail(),
              SizedBox(
                height: 10,
              ),
              _rowSenha(),
              _botaoSalvar(),
              //_carregar(),
            ],
          ),
        ),
      ),
    );
  }

  _carregaImagem() {
    return SizedBox(
      child: Center(
        child: Column(
          children: <Widget>[
            ShowImage(),
            IconButton(
              icon: Icon(
                Icons.add_a_photo,
                color: Colors.green,
              ),
              onPressed: () {
                pickerImageGallery(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  _textFormFieldNome() {
    return TextFormField(
      controller: _nomeController,
      decoration: InputDecoration(
        hintText: 'Nome completo',
        alignLabelWithHint: true,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(5),
          borderSide: new BorderSide(),
        ),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Digite seu nome completo';
        }
        _nome = _passKey.currentState.value;
      },
      onSaved: (value) {
        setState(() {
          _nome = value;
        });
      },
    );
  }

  _textFormFieldEmail() {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        hintText: 'Email',
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(5),
          borderSide: new BorderSide(),
        ),
      ),
      validator: (value) => value.isEmpty ? "" : null,
      onSaved: (value) => _email = value,
    );
  }

  _textFormFieldSenha() {
    return TextFormField(
      controller: _senhaController,
      obscureText: !_visivel,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(_visivel ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _visivel = !_visivel;
            });
          },
        ),
        hintText: 'Senha',
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(5),
          borderSide: new BorderSide(),
        ),
      ),
      validator: (value) => value.isEmpty ? "Entre com a senha" : null,
      onSaved: (value) => _senha = value,
    );
  }

  _textFormFieldRepetirSenha() {
    return TextFormField(
      controller: _senhaRController,
      obscureText: !_visivel,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(_visivel ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _visivel = !_visivel;
            });
          },
        ),
        hintText: 'Repita a Senha',
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(5),
          borderSide: new BorderSide(),
        ),
      ),
      validator: (value) => value.isEmpty ? "Repiata sua senha" : null,
      onSaved: (value) => _senhaR = value,
    );
  }

  _rowSenha() {
    return Row(
      children: <Widget>[
        new Flexible(
          child: _textFormFieldSenha(),
        ),
        SizedBox(
          width: 5,
        ),
        new Flexible(
          child: _textFormFieldRepetirSenha(),
        )
      ],
    );
  }

  _botaoSalvar() {
    return RaisedButton(
      color: Colors.green,
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
      onPressed: validar,
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0),
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: Text('Salvar',
              style: TextStyle(fontSize: 26), textAlign: TextAlign.center)),
    );
  }
}

String ConvertImageToString(File img) {
  List<int> imageBytes = img.readAsBytesSync();
  var r = base64Encode(imageBytes);
  print('Aqui==============>: ' + r.toString());
  return r;
}
