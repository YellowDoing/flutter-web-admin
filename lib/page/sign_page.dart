import 'package:admin_flutter_web/data/auth_data.dart';
import 'package:admin_flutter_web/entry/user_entity.dart';
import 'package:admin_flutter_web/util/http_util.dart';
import 'package:admin_flutter_web/widget/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SignPage extends StatefulWidget {
  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  var _username = '';
  var _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              children: [
                _buildLogoAndTitle(),
                _buildSubTitle(),
                _buildUserNameInput(),
                _buildPasswordInput(),
                _buildForgetPassword(),
                _buildLoginButton(),
              ],
            )
          ],
        ),
      ),
    );
  }

  ///Logo和标题
  Widget _buildLogoAndTitle() {
    return Container(
      margin: EdgeInsets.only(top: 64,bottom: 16),
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 55,
          margin: EdgeInsets.only(right: 12),
          child: Image.asset('res/images/flutter-icon.png'),
        ),
        Text(
          'Flutter Web Admin',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
        )
      ],
    ));
  }

  ///副标题
  Widget _buildSubTitle() {
    return Text('Flutter Web Admin 是使用Dart语言和Flutter技术开发的后台管理系统模板',
        style: TextStyle(color: Colors.grey, fontSize: 14));
  }

  ///用户名输入框
  Widget _buildUserNameInput() {
    return Container(
        margin: EdgeInsets.only(top: 60),
        height: 48,
        width: 360,
        child: TextField(
            onChanged: (value) => _username = value,
            decoration: InputDecoration(
                labelText: '用户名', border: OutlineInputBorder())));
  }

  ///密码输入框
  Widget _buildPasswordInput() {
    return Container(
        height: 48,
        width: 360,
        margin: EdgeInsets.only(top: 12),
        child: TextField(
            onChanged: (value) => _password = value,
            obscureText: true,
            decoration: InputDecoration(
                labelText: '密码', border: OutlineInputBorder())));
  }

  ///登录按钮
  Widget _buildLoginButton() {
    return Container(
      width: 360,
      margin: EdgeInsets.only(top: 10),
      height: 38,
      child: MaterialButton(
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            _login();
          },
          child: Text('登 录',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15),)),
    );
  }

  ///登录
  void _login() {
    if (_username.isEmpty) {
      return;
    }

    if (_password.isEmpty) {
      return;
    }

    HttpUtil<UserEntity>.post(
      url: 'http://127.0.0.1:8080/admin/login',
      body: {
        'account': _username,
        'password': _password,
      },
      success: (data, message) {
        context.read<AuthData>().login(data);
      },
      error: (code, message) {
      },
      complete: () {
      },
    );
  }

  ///忘记密码
  Widget _buildForgetPassword() {
    return Container(
      width: 360,
      margin: EdgeInsets.only(top: 4,bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            child: Text('忘记密码', style: TextStyle(color: Colors.grey[600])),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
