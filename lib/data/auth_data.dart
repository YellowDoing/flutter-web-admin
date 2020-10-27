import 'package:flutter/cupertino.dart';


///存放用户数据
class AuthData with ChangeNotifier{


  bool isLogin = false;


  void setLogin(bool login){
    isLogin = login;
    notifyListeners();
  }

}