import '../Usuario.dart';
import 'package:efcontrole/data/Res_data.dart';

abstract class LoginPageContract{
  void onLoginSuccess(Usuario user);
  void onLoginError(String error);
}

class LoginPagePresenter{
  LoginPageContract _View;
  RestData api=new RestData();
}