import 'package:admin_flutter_web/entry/account_entity.dart';
import 'package:flutter/cupertino.dart';

class AuthData with ChangeNotifier{

  bool isLogin = false;

  AccountEntity accountEntity;


  void login(AccountEntity accountEntity){
    isLogin = true;
    this.accountEntity = accountEntity;
    notifyListeners();
  }

}