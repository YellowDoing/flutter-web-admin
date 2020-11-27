import 'dart:convert';

import 'package:admin_flutter_web/entry/user_entity.dart';
import 'package:admin_flutter_web/generated/json/base/json_convert_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';


final authData =  new AuthData();

///存放用户数据
class AuthData with ChangeNotifier{


  bool isLogin = false;

  UserEntity userEntity;


  AuthData(){
    SharedPreferences.getInstance().then((sp)  {
      isLogin = sp.containsKey("userEntity");
      if(isLogin){
        userEntity =  JsonConvert.fromJsonAsT<UserEntity>(jsonDecode(sp.getString("userEntity")));
    }
    });
  }

  void setLogin(UserEntity userEntity){
    isLogin = true;
    this.userEntity = userEntity;
    SharedPreferences.getInstance().then((sp) => {
      sp.setString("userEntity", jsonEncode(userEntity.toJson()))
    });
    notifyListeners();
  }

}