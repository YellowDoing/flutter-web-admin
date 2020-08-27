import 'package:admin_flutter_web/data/auth_data.dart';
import 'package:admin_flutter_web/entry/account_entity.dart';
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
  var _account = '';
  var _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('管理后台')],
            ),
            Input(
              icon: Icon(Icons.person_outline),
              margin: EdgeInsets.only(top: 12),
              hint: '账号',
              onChanged: (value) {
                _account = value;
              },
            ),
            Input(
                obscureText: true,
                icon: Icon(Icons.lock_outline),
                margin: EdgeInsets.only(top: 12),
                hint: '密码',
                onChanged: (value) {
                  _password = value;
                }),
            Container(
              margin: EdgeInsets.only(top: 6),
              width: 230,
              child: MaterialButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _login();
                  },
                  child: Text('登录')),
            )
          ],
        ),
      ),
    );
  }

  void _login() {
    HttpUtil<AccountEntity>.post(
        url: 'http://127.0.0.1:8080/admin/login',
        body: {'account': _account, 'password': _password},
        success: (data, message) {
          context.read<AuthData>().login(data);
        });
  }
}
