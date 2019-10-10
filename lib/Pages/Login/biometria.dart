import 'dart:io';
import 'package:efcontrole/Pages/Principal/principal.dart';
import 'package:efcontrole/Utils/global.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class LoginBeometria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.amber, fontFamily: "Ubuntu"),
      home: LoginPageBeometria(),
    );
  }
}

class LoginPageBeometria extends StatefulWidget {
  @override
  _LoginPageBeometriaState createState() => _LoginPageBeometriaState();
}

class _LoginPageBeometriaState extends State<LoginPageBeometria> {
  final LocalAuthentication auth = LocalAuthentication();
  @override
  void initState() {
    super.initState();
    //_criaDir();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    setState(() {
      if (!VarGlobal.Logado) _biometriaca();
      print("Tela de login biometria------------------------------");
    });
    return Scaffold();
  }

  Future<void> _biometriaca() async {
    //if (VarGlobal.logado) return;
    bool flag = true;
    if (flag) {
      bool autenticado = false;
      const androidString = const AndroidAuthMessages(
          cancelButton: "Cancelar",
          goToSettingsButton: "Ajustar",
          signInTitle: "Identificação biométrica",
          fingerprintHint: "Toque com sua digital",
          fingerprintNotRecognized: "Digital não reconhecida",
          goToSettingsDescription: "Por favor configure sua digital");
      try {
        autenticado = await auth.authenticateWithBiometrics(
            localizedReason: "Autentique-se",
            useErrorDialogs: true,
            stickyAuth: true,
            androidAuthStrings: androidString);

        if (!autenticado) {
          exit(0);
        } else {
          print('Logado -----------');
          VarGlobal.Logado = true;
          Navigator.pushReplacement(
            context,
            new MaterialPageRoute(builder: (context) => new Principal()),
          );
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
