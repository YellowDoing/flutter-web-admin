import 'package:flutter/material.dart';

import 'my/my_expansion_pane.dart' as My;

///菜单项
class MenuItem {
  ///显示的文本
  final String text;

  ///子项显示的文本
  final List<String> subItems;

  ///是否默认展开
  bool defaultExpand;

  ///图标
  Widget icon;

  MenuItem(
      {@required this.text,
        this.subItems = const [],
        this.icon,
        this.defaultExpand = false});
}

class MenuController extends ChangeNotifier {
  String selectId;

  MenuController({String defaultSelectId = '1'}) : selectId = defaultSelectId;

  void select(String id) {
    selectId = id;
    notifyListeners();
  }
}

class Menu extends StatefulWidget {
  final Color color;

  final Color expandColor;

  final Color selectColor;

  final Color selectItemColor;

  final List<MenuItem> items;

  final double width;

  final double height;

  final ValueChanged<String> onMenuSelected;

  final MenuController menuController;

  Menu(
      {@required this.items,
        this.width = 230,
        this.height = double.infinity,
        this.color = Colors.white,
        this.selectColor = const Color(0xFFEEEEEE),
        this.selectItemColor = const Color(0xFFEEEEEE),
        this.expandColor = const Color(0xdcfafafa),
        @required this.menuController,
        @required this.onMenuSelected})
      : assert(onMenuSelected != null),
        assert(items != null);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String _selectId;

  final List<bool> _expands = [];

  @override
  void initState() {
    _selectId = widget.menuController.selectId;
    widget.menuController.addListener(() {
      setState(() {
        _selectId = widget.menuController.selectId;
        widget.onMenuSelected?.call(_selectId);
      });
    });
    widget.items.forEach((element) {_expands.add(element.defaultExpand);});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: widget.color,
        height: widget.height,
        width: widget.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: SingleChildScrollView(
                  child: _buildExpansionPanelList(),
                )),
            _buildRightVerticalLine()
          ],
        ));
  }

  My.ExpansionPanelList _buildExpansionPanelList() {
    return My.ExpansionPanelList(
      expansionCallback: (index, isExpanded) {

        var item = widget.items[index];

        if (item.subItems.isEmpty) {
          setState(() {
            _selectId = (index + 1).toString();
          });
          widget.onMenuSelected?.call(_selectId);
        }else{
          setState(() {
            _expands[index]= !isExpanded;
          });
        }
      },
      children: _buildMenuItems(),
    );
  }

  ///右侧分割线
  Container _buildRightVerticalLine() {
    return Container(
      height: double.infinity,
      width: 1,
      color: Colors.grey[200],
    );
  }

  List<My.ExpansionPanel> _buildMenuItems() {
    return widget.items.map((menuItem) {
      var index = widget.items.indexOf(menuItem);
      var id = ( index + 1).toString();

      return My.ExpansionPanel(
          showRightIcon: menuItem.subItems.isNotEmpty,
          isExpanded: _expands[index],
          headerColor: (_selectId == id && menuItem.subItems.isEmpty)
              ? widget.selectColor
              : null,
          headerBuilder: (_, expand) {
            return Container(
              padding: EdgeInsets.only(left: 14),
              child: Row(
                children: [
                  menuItem.icon ?? Container(),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(menuItem.text),
                  )
                ],
              ),
            );
          },
          body: Container(
            color: widget.expandColor,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: menuItem.subItems.map((subTitle) {
                return _buildMenSubItem(menuItem, subTitle);
              }).toList(),
            ),
          ),
          canTapOnHeader: true);
    }).toList();
  }

  RawMaterialButton _buildMenSubItem(MenuItem menuItem, String subTitle) {
    var itemId =
        '${widget.items.indexOf(menuItem) + 1}-${menuItem.subItems.indexOf(subTitle) + 1}';

    return RawMaterialButton(
      child: Container(
        color: _selectId == itemId ? widget.selectItemColor : null,
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(42, 12, 0, 12),
        child: Text(subTitle),
      ),
      onPressed: () {
        setState(() {
          _selectId = itemId;
        });
        widget.onMenuSelected?.call(_selectId);
      },
    );
  }
}
