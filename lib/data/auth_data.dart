import 'dart:convert';

import 'package:admin_flutter_web/entry/user_entity.dart';
import 'package:admin_flutter_web/generated/json/base/json_convert_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';


final authData =  new AuthData();

///存放用户数据
class AuthData with ChangeNotifier{

  //登录状态
  bool isLogin = false;

  AuthData(){
    SharedPreferences.getInstance().then((sp)  {
      isLogin = sp.getBool("isLogin")??false;
    });
  }

  void setLogin(bool login){
    isLogin = login;
    SharedPreferences.getInstance().then((sp) => {
      sp.setBool("isLogin", isLogin)
    });
    notifyListeners();
  }

}