import 'package:admin_flutter_web/entry/user_entity.dart';
import 'package:flutter/cupertino.dart';


final authData =  new AuthData();

///存放用户数据
class AuthData with ChangeNotifier{


  bool isLogin = false;

  UserEntity userEntity;


  void setLogin(UserEntity userEntity){
    isLogin = true;
    this.userEntity = userEntity;
    notifyListeners();
  }

}