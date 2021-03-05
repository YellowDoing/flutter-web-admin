import 'dart:html' as html;
import 'package:admin_flutter_web/view/dashboard_view.dart';
import 'package:admin_flutter_web/view/level_view.dart';
import 'package:admin_flutter_web/view/role_view.dart';
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


  String _menuSelectId = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Row(
        children: [_buildMenu(), Expanded(child: _buildContent())],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildContent() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(16),
      child: _getContentViewById(),
    );
  }

  final Map<String,Widget> _views = new Map();

  Widget _getContentViewById() {

    Widget content = _views[_menuSelectId];
    if(content == null){
      switch(_menuSelectId){
        case '1':
          content = DashboardView();
          break;
        case '2':
          content = RoleView();
          break;
        case '3-1':
          content = LevelView();
          break;
      }
      _views[_menuSelectId] = content;
    }
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(16),
      child: content,
    );
  }

  ///左侧菜单导航
  Menu _buildMenu() {
    return Menu(
      menuController: MenuController(defaultSelectId: '1'),
      onMenuSelected: _onMenuSelect,
      items: [
        MenuItem(
            text: '概览',
            icon: Icon(Icons.dashboard, size: 19)),
        MenuItem(
            text: '角色管理',
            icon: Icon(Icons.supervisor_account_outlined, size: 19)),
        MenuItem(
            text: '游戏设置',
            defaultExpand: true,
            subItems: ['等级'],
            icon: Icon(Icons.tune, size: 19)),
        // MenuItem(
        //     text: 'Navigation One',
        //     defaultExpand: true,
        //     subItems: ['subItem one', 'subItem two', 'subItem three'],
        //     icon: Icon(Icons.tune, size: 19)),
      ],
    );
  }

  void _onMenuSelect(id) {
    debugPrint(id);
    setState(() {
      _menuSelectId = id;
    });
    switch (id) {
    }
  }

  ///顶栏
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

  ///图标和名称
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
        tooltip: '多语言  ',
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
        tooltip: '我的  ',
        child: Padding(
          padding: EdgeInsets.fromLTRB(12, 0, 16, 0),
          child: Row(
            children: [
              ClipOval(child: Image.asset('res/images/avatar.jpg', width: 36)),
              Padding(
                padding: EdgeInsets.only(left: 6),
                child: Text(
                  'Catalina',
                  style: TextStyle(fontSize: 15),
                ),
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
        tooltip: '帮助  ',
        child: Padding(
          padding: EdgeInsets.fromLTRB(12, 0, 14, 0),
          child: Icon(
            Icons.help_outline,
            size: 26,
          ),
        ),
        itemBuilder: (_) => []);
  }

  ///Github
  Widget _actionGithub() {
    return PopupMenuButton(
        offset: Offset(0, 68),
        tooltip: 'Github  ',
        child: GestureDetector(
          child: Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 16, 0),
            child: Image.asset(
              'res/images/github.png',
              width: 21,
            ),
          ),
          onTap: () {
            html.window.open('https://github.com/YellowDoing/flutter-web-admin',
                'flutter-web-admin');
          },
        ),
        itemBuilder: (_) => []);
  }

}
