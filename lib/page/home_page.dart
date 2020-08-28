import 'package:admin_flutter_web/view/table_view.dart';
import 'package:admin_flutter_web/widget/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:admin_flutter_web/widget/my/my_popup_menu.dart' as My;
import '../my_flutter_app_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Row(
        children: [
          _buildMenu(),
          Expanded(
              child: Container(
            width: double.infinity,
            height: double.infinity,
            child: TableView(),
          ))
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Menu _buildMenu() {
    return Menu(
          items: [
            MenuItem(
                text: 'Navigation One',
                subItems: ['subItem one', 'subItem two', 'subItem three'],
                defaultExpanded: true,
                icon: Icon(
                  Icons.tune,
                  size: 19,
                )),
            MenuItem(
                text: 'Navigation Two',
                subItems: ['subItem one', 'subItem two', 'subItem three'],
                icon: Icon(
                  Icons.update,
                  size: 19,
                )),
            MenuItem(
                text: 'Navigation Three',
                subItems: ['subItem one', 'subItem two', 'subItem three'],
                icon: Icon(
                  Icons.wallpaper,
                  size: 19,
                )),

            MenuItem(
                text: '个人页',
                subItems: ['个人中心', '个人设置'],
                icon: Icon(
                  Icons.wallpaper,
                  size: 19,
                )),

            MenuItem(
                text: 'Navigation Four',
                icon: Icon(
                  Icons.wrap_text,
                  size: 19,
                )),
            MenuItem(
                text: 'Navigation Five',
                icon: Icon(
                  Icons.vibration,
                  size: 19,
                )),
          ],
        );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 68,
      centerTitle: false,
      elevation: 3,
      title: _buildLogoAndTitle(),
      actions: [

        _actionHelp(),

        _actionGithub(),

        _actionTranslate(),

        _actionUserInfo(),
      ],
    );
  }

  Row _buildLogoAndTitle() {
    return Row(
      children: [
        Container(
          width: 44,
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(right: 12),
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: Image.asset('res/images/flutter-icon.png'),
        ),
        Text('Flutter Web Admin')
      ],
    );
  }

  ///国际化
  Widget _actionTranslate() {
    return PopupMenuButton(
        offset: Offset(0, 68),
        tooltip: '多语言',
        child: Padding(
          padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: Row(
            children: [
              Icon(MyFlutterFonts.translate),
              Padding(
                padding: EdgeInsets.only(left: 6),
                child: Text('Language'),
              )
            ],
          ),
        ),
        itemBuilder: (_) => [
              PopupMenuItem(child: Text('中文')),
              PopupMenuItem(child: Text('English'))
            ]);
  }


  ///用户信息
  Widget _actionUserInfo() {
    return PopupMenuButton(
        offset: Offset(0, 68),
        tooltip: '我的',
        child: Padding(
          padding: EdgeInsets.fromLTRB(12, 0, 16, 0),
          child: Row(
            children: [
              ClipOval(child: Image.asset('res/images/avatar.jpg',width: 36))
              ,Padding(
                padding: EdgeInsets.only(left: 6),
                child: Text('Catalina',style: TextStyle(fontSize: 15),),
              )
            ],
          ),
        ),
        itemBuilder: (_) => [
          PopupMenuItem(child: Text('中文')),
          PopupMenuItem(child: Text('English'))
        ]);
  }


  ///帮助
  Widget _actionHelp() {
    return PopupMenuButton(
        offset: Offset(0, 68),
        tooltip: '帮助',
        child: Padding(
          padding: EdgeInsets.fromLTRB(12, 0, 14, 0),
          child: Icon(Icons.help_outline,size: 26,),
        ),
        itemBuilder: (_) => []);
  }

  ///res/images/github.png
  Widget _actionGithub() {
    return PopupMenuButton(
        offset: Offset(0, 68),
        tooltip: 'Github',
        child: Padding(
          padding: EdgeInsets.fromLTRB(12, 0, 16, 0),
          child: Image.asset('res/images/github.png',width: 21,),
        ),
        itemBuilder: (_) => []);
  }
}
