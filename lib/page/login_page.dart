
import 'package:admin_flutter_web/data/auth_data.dart';
import 'package:admin_flutter_web/entry/user_entity.dart';
import 'package:admin_flutter_web/util/http_util.dart';
import 'package:admin_flutter_web/util/view_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';


///登录页
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var _username = '';
  var _password = '';

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('res/images/sign_bg_2.jpg')
          )
        ),
        child: Stack(
          children: [
            Column(
              children: [
                _buildLogoAndTitle(),
                _buildSubTitle(),
                _buildUserNameInput(),
                _buildPasswordInput(),
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
      margin: EdgeInsets.only(top: 64,bottom: 36),
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 55,
          margin: EdgeInsets.only(right: 12),
          child: Image.asset('res/images/flutter-icon.png'),
        ),
        Text(
          '后台管理系统',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
        )
      ],
    ));
  }

  ///副标题
  Widget _buildSubTitle() {
    return Text('Flutter Web Admin 是使用Dart语言和Flutter技术开发的后台管理系统模板',
        style: TextStyle(color: Colors.blueGrey, fontSize: 14));
  }

  ///用户名输入框
  Widget _buildUserNameInput() {
    return Container(
      color: Colors.white,
        margin: EdgeInsets.only(top: 48),
        height: 44,
        width: 360,
        child: TextField(
            onChanged: (value) => _username = value,
            decoration: InputDecoration(
                labelText: '用户名', border: OutlineInputBorder())));
  }

  ///密码输入框
  Widget _buildPasswordInput() {
    return Container(
        color: Colors.white,
        height: 44,
        width: 360,
        margin: EdgeInsets.only(top: 16),
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
      toast(context, '请输入账号');
      return;
    }

    if (_password.isEmpty) {
      toast(context, '请输入密码');
      return;
    }

    HttpUtil<UserEntity>.post('/admin/login',
      body: {
          'username':_username,
        'password':_password
        },
      key: false,
      success: (data, message) {
        toast(context, '登录成功');
        authData.setLogin(data);
      },
    );


  }

}
