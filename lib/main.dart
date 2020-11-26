import 'package:admin_flutter_web/data/auth_data.dart';
import 'package:admin_flutter_web/page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page/home_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthData>.value(value: authData),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '后台管理系统',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: context.watch<AuthData>().isLogin ?
      HomePage():LoginPage(),
    );
  }
}


