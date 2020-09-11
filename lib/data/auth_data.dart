import 'package:admin_flutter_web/entry/user_entity.dart';
import 'package:flutter/cupertino.dart';

class AuthData with ChangeNotifier{


  bool isLogin = false;

  UserEntity userEntity;


  void login(UserEntity userEntity){

    isLogin = true;

    this.userEntity = userEntity;

    notifyListeners();

  }

}